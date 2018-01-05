//
//  Mary.m
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mary.h"

@implementation Mary

- (instancetype)init{
    self = [super init];
    self.m_score=0;
    self.forward=true;
    self.m_isBacking=false;
    self.m_isLiving=true;
    self.m_isRuning=false;
    self.m_isJumping=false;
    self.m_map=nil;
    self.jumpTimes=0;
    [self setMultipleTouchEnabled:YES];
    return self;
}

-(void)setViewPointByPlayer
{
    if(self.m_sprite==nil)
        return;
    CGSize mapTiledNum=[self.m_map mapSize];
    CGSize tiledSize=[self.m_map tileSize];
    CGSize mapSize = CGSizeMake(mapTiledNum.width*tiledSize.width,mapTiledNum.height*tiledSize.height);
    CGSize size=[[CCDirector sharedDirector] viewSize];
    CGPoint spritePos=[self position];
    
    float x = spritePos.x > size.width/2 ? spritePos.x : size.width/2;
    float y = spritePos.y > size.height/2? spritePos.y : size.height/2;
    
    
    x=x > mapSize.width-size.width/2 ? mapSize.width-size.width/2 : x;
    y=y > mapSize.height-size.height/2 ? mapSize.height-size.height/2 : y;
    
    
    CGPoint desPos=CGPointMake(x,y);
    
    CGPoint centerPos=CGPointMake(size.width/2,size.height/2);
    
    CGPoint viewPos=ccpSub(centerPos,desPos);
    [[self parent] setPosition:viewPos];
}

-(void)setTiledMap:(CCTiledMap *)map{
    self.m_map=map;
    self.meta = [self.m_map layerNamed:@"sea"];
    [self.meta setVisible:NO];
    self.guandao = [self.m_map layerNamed:@"guandao"];
    [self.guandao setVisible:YES];
}

-(CCAction*)runByAction{
    if(self.m_sprite==nil)
        return nil;
    self.m_isRuning=YES;
    int iFrameNum=2;
    CCSpriteFrame* frame=nil;
    NSMutableArray* frameArray=[[NSMutableArray alloc]init];
    for(int i=1;i<=iFrameNum;i++)
    {
        frame=[CCSpriteFrame frameWithImageNamed:[NSString stringWithFormat:@"mario/mary%d.png",i]];//
        [frame setAccessibilityFrame:CGRectMake(0,0,35,60)];
        [frameArray addObject:frame];
    }
    self.animation=[CCAnimation animationWithSpriteFrames:frameArray delay:0.1f];
    self.animation.loops=-1;
    self.action = [CCActionAnimate actionWithAnimation:self.animation];
    return self.action;
}

-(void)run{
    if(!self.m_isJumping)
    {
        if(self.m_isLiving)
        {
            self.forward=YES;
            if(self.m_isBacking)
                self.animation.loops=0;
            [self.m_sprite runAction:self.runByAction];
        }
    }
    else
    {
        self.m_isRuning=YES;
        self.forward=YES;
        CCTexture* texture = [CCTexture textureWithFile:@"mario/mary7.png"];
        [self.m_sprite setTexture:texture];
    }
}

-(CCAction*)backByAction{
    if(self.m_sprite==nil)
        return nil;
    self.m_isBacking=YES;
    int iFrameNum=2;
    CCSpriteFrame* frame=nil;
    NSMutableArray* frameArray=[[NSMutableArray alloc]init];
    for(int i=1;i<=iFrameNum;i++)
    {
        frame=[CCSpriteFrame frameWithImageNamed:[NSString stringWithFormat:@"mario/back%d.png",i]];//
        [frame setAccessibilityFrame:CGRectMake(0,0,35,60)];
        [frameArray addObject:frame];
    }
    self.animation=[CCAnimation animationWithSpriteFrames:frameArray delay:0.1f];
    self.animation.loops=-1;
    self.action = [CCActionAnimate actionWithAnimation:self.animation];
    return self.action;
}

-(void)back{
    if(!self.m_isJumping)
    {
        if(self.m_isLiving)
        {
            self.forward=NO;
            if(self.m_isRuning)
                self.animation.loops=0;
            CCTexture* texture = [CCTexture textureWithFile:@"mario/back1.png"];
            [self.m_sprite setTexture:texture];
            [self.m_sprite runAction:self.backByAction];
        }
    }
    else
    {
        self.m_isBacking=YES;
        self.forward=NO;
        CCTexture* texture = [CCTexture textureWithFile:@"mario/mary8.png"];
        [self.m_sprite setTexture:texture];
    }
}

-(void)jump{
    if(self.m_sprite==nil)
        return;
    if(self.m_isJumping)
        return;
    if(!self.m_isLiving)
        return;
    self.m_isJumping=YES;
    if(self.m_isRuning || self.m_isBacking)
        self.animation.loops=0;
    if(self.forward || self.m_isRuning)
    {
        CCTexture* texture = [CCTexture textureWithFile:@"mario/mary7.png"];
        [self.m_sprite setTexture:texture];
    }
    else if (!self.forward || self.m_isBacking)
    {
        CCTexture* texture = [CCTexture textureWithFile:@"mario/mary8.png"];
        [self.m_sprite setTexture:texture];
    }
    CCTiledMapObjectGroup* objGroup=[self.m_map objectGroupNamed:@"object"];
    NSMutableDictionary* playerPointDic=[objGroup objectNamed:@"PlayerPoint"];
    //float playerX=[[playerPointDic valueForKey:@"x"] floatValue];
    float playerY=[[playerPointDic valueForKey:@"y"] floatValue];
    
    float y=self.position.y;
    CCLOG(@"Y1=%f,y2=%f",playerY,y);
    
    if(self.m_isRuning  || self.m_isBacking)
    {
        CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.0f position:ccp(0,0) height:100 jumps:1];
        //CCActionMoveBy* moveBy = [CCActionMoveBy actionWithDuration:0.15f position:ccp(0,0)];
        CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
        CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,callFunc, nil];
        [self runAction:jumpAction];
    }
    else
    {
        CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.0f position:ccp(0,0) height:100 jumps:1];
        CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
        CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,callFunc, nil];
        [self runAction:jumpAction];
    }
//    if(y>140)
//    {
//        if(self.m_isRuning  || self.m_isBacking)
//        {
//            CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.5f position:ccp(0,43) height:150 jumps:1];
//            CCActionMoveBy* moveBy = [CCActionMoveBy actionWithDuration:0.15f position:ccp(0,-55)];
//            CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
//            CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,moveBy,callFunc, nil];
//            [self runAction:jumpAction];
//        }
//        else
//        {
//            CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.5f position:ccp(0,45) height:150 jumps:1];
//            CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
//            CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,callFunc, nil];
//            [self runAction:jumpAction];
//        }
//    }
//    else if(y>122 && y<140)
//    {
//        CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.5f position:ccp(0,43) height:150 jumps:1];
//        CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
//        CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,callFunc, nil];
//        [self runAction:jumpAction];
//    }
//    else if(y<122)
//    {
//        CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.5f position:ccp(0,45) height:150 jumps:1];
//        CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
//        CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,callFunc, nil];
//        [self runAction:jumpAction];
//    }
//    else
//    {
//        CCActionJumpBy* jumpBy = [CCActionJumpBy actionWithDuration:1.5f position:ccp(0,44) height:150 jumps:1];
//        CCActionCallFunc* callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(jumpEnd)];
//        CCActionInterval * jumpAction= [CCActionSequence actions:jumpBy,callFunc, nil];
//        [self runAction:jumpAction];
//    }
}

-(void)jumpEnd{
    if((!self.m_isRuning) && (!self.m_isBacking))
    {
        if(self.forward)
        {
            CCTexture* texture = [CCTexture textureWithFile:@"mario/mary1.png"];
            [self.m_sprite setTexture:texture];
        }
        else
        {
            CCTexture* texture = [CCTexture textureWithFile:@"mario/back1.png"];
            [self.m_sprite setTexture:texture];
        }
    }
    self.m_isJumping=NO;
}

@end
