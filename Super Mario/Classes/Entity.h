//
//  Entity.h
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Controller.h"

@interface Entity : ControllerListener

-(void)bindSprite:(CCSprite*)sprite;
-(void)setController:(Controller*)controller;

-(void)setTagPosition:(int)x andY:(int)y;
-(CGPoint)getTagPosition;

@property CCSprite* m_sprite;
@property Controller* m_controller;

@end
