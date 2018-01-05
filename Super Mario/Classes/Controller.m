//
//  Controller.m
//  Super Mario
//
//  Created by 周新哲 on 2017/12/29.
//  Copyright © 2017年 master. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"

@implementation Controller

-(void) setControllerListener:(ControllerListener*) controllerListener{
    self.m_controllerListener = controllerListener;
}

@end
