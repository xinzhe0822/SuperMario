//
//  MenuScene.m
//  Super Mario
//
//  Created by 周新哲 on 2017/12/28.
//  Copyright © 2017年 master. All rights reserved.
//

#import "GameScene.h"

// -----------------------------------------------------------------------

@implementation GameScene

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    
    
    CCTiledMap *map = [[CCTiledMap alloc] initWithFile:@"mario/level1.tmx"];
    
    [self addPlayer:map];
    [self addButton];
    [self addChild:map];
    
    // done
    return self;
}

-(void) addPlayer:(CCTiledMap *)map{
    //CGSize visibleSize=[[CCDirector sharedDirector] viewSize];
    CCSprite* sprite=[[CCSprite alloc] initWithImageNamed:@"mario/mary1.png"];
    self.m_mary=[[Mary alloc] init];
    [self.m_mary bindSprite:sprite];
    [self.m_mary setTiledMap:map];
    CCTiledMapObjectGroup* objGroup=[map objectGroupNamed:@"object"];
    
    NSMutableDictionary* playerPointDic=[objGroup objectNamed:@"PlayerPoint"];
    float playerX=[[playerPointDic valueForKey:@"x"] floatValue];
    float playerY=[[playerPointDic valueForKey:@"y"] floatValue];
    [self.m_mary setPosition:ccp(playerX,playerY)];
    [map addChild:self.m_mary];
    self.m_moveController=[[MoveController alloc] init];
    [self.m_moveController setM_iSpeed:0];
    [self addChild:self.m_moveController];
    [self.m_mary setController:self.m_moveController];
    
    
//    for(int i=1;i<=5;i++)
//    {
//        CCSprite* sp1=CCSprite::createWithSpriteFrame(CCSpriteFrame::create("mario/coin.png",CCRectMake(0,0,30,27)));
//        m_money=Money::create();
//        m_money->bindSprite(sp1);
//        m_money->bindPlayer(m_mary);
//        CCTMXObjectGroup* objGroup1=map->objectGroupNamed("object");
//        CCDictionary* moneyPointDic=objGroup1->objectNamed(CCString::createWithFormat("MoneyPoint%d",i)->getCString());
//        float moneyX=moneyPointDic->valueForKey("x")->floatValue();
//        float moneyY=moneyPointDic->valueForKey("y")->floatValue();
//        m_money->setPosition(ccp(moneyX,moneyY));
//        map->addChild(m_money);
//    }
}

-(void)addButton{
    //forward button
    CCSpriteFrame *forward = [CCSpriteFrame frameWithImageNamed:@"mario/forward.png"];
    CCButton *forwardButton = [CCButton buttonWithTitle:@"" spriteFrame:forward];
    forwardButton.positionType = CCPositionTypeNormalized;
    forwardButton.position = ccp(0.3,0.2);
    forwardButton.scale = 0.8;
    [forwardButton setTarget:self selector:@selector(onForwardClicked)];
    [forwardButton setZOrder:1];
    [self addChild:forwardButton];
    
    //back button
    CCSpriteFrame *back = [CCSpriteFrame frameWithImageNamed:@"mario/back.png"];
    CCButton *backButton = [CCButton buttonWithTitle:@"" spriteFrame:back];
    backButton.positionType = CCPositionTypeNormalized;
    backButton.position = ccp(0.1,0.2);
    backButton.scale = 0.8;
    [backButton setTarget:self selector:@selector(onBackClicked)];
    [backButton setZOrder:1];
    [self addChild:backButton];
    
    //jump button
    CCSpriteFrame *jump = [CCSpriteFrame frameWithImageNamed:@"mario/up.png"];
    CCButton *jumpButton = [CCButton buttonWithTitle:@"" spriteFrame:jump];
    jumpButton.positionType = CCPositionTypeNormalized;
    jumpButton.position = ccp(0.8,0.2);
    jumpButton.scale = 0.8;
    [jumpButton setTarget:self selector:@selector(onJumpClicked)];
    [jumpButton setZOrder:1];
    [self addChild:jumpButton];
}

-(void) onForwardClicked{
    NSLog(@"123");
    if(self.m_mary.m_isRuning)
        return;
    self.forward=YES;
    self.m_mary.m_isRuning=YES;
    if(self.m_mary.m_isBacking)
    {
        if(!self.m_mary.m_isJumping)
        {
            self.m_mary.animation.loops = 0;
        }
    }
    self.m_mary.m_isBacking=NO;
    [self.m_mary run];
    self.m_moveController.m_iSpeed = 6;
}

-(void) onBackClicked{
    if(self.m_mary.m_isBacking)
        return;
    self.forward=NO;
    self.m_mary.m_isBacking=YES;
    if(self.m_mary.m_isRuning)
    {
        if(!self.m_mary.m_isJumping)
        {
            self.m_mary.animation.loops = 0;
        }
    }
    self.m_mary.m_isRuning=NO;
    [self.m_mary back];
    self.m_moveController.m_iSpeed = -6;
}

-(void)onJumpClicked{
    [self.m_mary jump];
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    NSLog(@"456");
}
// -----------------------------------------------------------------------

@end
