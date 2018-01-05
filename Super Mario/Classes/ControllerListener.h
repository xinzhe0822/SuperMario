//
//  ControllerListener.h
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface ControllerListener :CCNode

-(void)setTagPosition:(int)x andY:(int)y;
-(CGPoint)getTagPosition;

@end
