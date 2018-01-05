//
//  MoveController.m
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoveController.h"

@implementation MoveController

-(instancetype)init{
    self = [super init];
    self.m_iSpeed=0;
    [self schedule:@selector(myUpdate:) interval:0.05f];
    return self;
}

-(void) myUpdate:(float)dt{
    if(self.m_controllerListener==NULL)
        return;
    CGPoint pos=[self.m_controllerListener getTagPosition];
    pos.x+=self.m_iSpeed;
    [self.m_controllerListener setTagPosition:pos.x andY:pos.y];
    
}


@end
