//
//  ControllerListener.m
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ControllerListener.h"

@implementation ControllerListener

-(void)setTagPosition:(int)x andY:(int)y{
    self.position = CGPointMake(x, y);
}

-(CGPoint)getTagPosition{
    return self.position;
}

@end
