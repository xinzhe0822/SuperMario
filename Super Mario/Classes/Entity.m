//
//  Entity.m
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@implementation Entity

-(void)bindSprite:(CCSprite*)sprite{
    self.m_sprite = sprite;
    [self addChild:_m_sprite];
}

-(void)setController:(Controller*)controller{
    self.m_controller=controller;
    [self.m_controller setControllerListener:self];
}

-(void)setTagPosition:(int)x andY:(int)y{
    self.position = CGPointMake(x, y);
}

-(CGPoint)getTagPosition{
    return self.position;
}


@end


