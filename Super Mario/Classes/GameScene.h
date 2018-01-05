//
//  MenuScene.h
//  Super Mario
//
//  Created by 周新哲 on 2017/12/28.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Mary.h"
#include "MoveController.h"

// -----------------------------------------------------------------------

@interface GameScene : CCScene

// -----------------------------------------------------------------------

@property Mary* m_mary;
@property MoveController* m_moveController;
@property bool forward;

- (instancetype)init;

-(void)addPlayer:(CCTiledMap*) map;

-(void)addButton;

-(void) onForwardClicked;

-(void) onBackClicked;

-(void) onJumpClicked;

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event;
// -----------------------------------------------------------------------

@end
