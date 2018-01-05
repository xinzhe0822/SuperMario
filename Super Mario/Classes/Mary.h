//
//  Mary.h
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Entity.h"

@interface Mary : Entity

@property bool m_isLiving;
@property bool m_isJumping;
@property bool m_isRuning;
@property bool m_isBacking;
@property CCAnimation* animation;
@property bool forward;
@property int m_score;
@property CCTiledMap *m_map;
@property CCTiledMapLayer* meta;
@property CCTiledMapLayer* guandao;
@property CCTiledMapLayer* obstacle;
@property CCAction* action;
@property int jumpTimes;

- (instancetype)init;

-(void)setViewPointByPlayer;

-(void)setTiledMap:(CCTiledMap *)map;

-(CCAction*)runByAction;

-(void)run;

-(CCAction*)backByAction;

-(void)back;

-(void)jump;

-(void)jumpEnd;

@end
