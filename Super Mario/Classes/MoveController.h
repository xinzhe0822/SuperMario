//
//  MoveController.h
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Controller.h"

@interface MoveController: Controller

@property int m_iSpeed;

- (instancetype)init;

-(void)myUpdate:(float)dt;

@end
