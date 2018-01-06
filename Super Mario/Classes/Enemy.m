//
//  Enemy.m
//
//  Created by : Mr.Right
//  Project    : Super Mario
//  Date       : 2018/1/6
//
//  Copyright (c) 2018年 master.
//  All rights reserved.
//
// -----------------------------------------------------------------

#import "Enemy.h"
#import "Hero.h"
#import "AnimationManager.h"
#import "GameMap.h"
#import "GameScene.h"
#import "Global.h"
// -----------------------------------------------------------------

@implementation Enemy

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    self.startFace = eLeft;
    self.moveOffset = 0.0f;
    self.ccMoveOffset = 0.6f;
    
    self.jumpOffset = 0.0f;
    self.ccJumpOffset = 0.3f;
    
    self.enemyState = eEnemyState_nonactive;
    
    return self;
}

// -----------------------------------------------------------------

@end

@implementation EnemyTortoiseRound

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void)reRigh{
    
}
- (void)reLeft{
    
}
// -----------------------------------------------------------------

@end

@implementation EnemyFireString

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void)launchFireString{
    
}
// -----------------------------------------------------------------

@end

@implementation EnemyFlyFish

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void) flyInSky{
    
}
- (void)reSetNotInSky{
    
}

// -----------------------------------------------------------------

@end

@implementation EnemyBoss

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void)moveLeft{
    
}
- (void)moveRight{
    
}

// -----------------------------------------------------------------

@end

@implementation EnemyAddMushroom

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void)addMushroom{
    
}
- (void)reSetNonAddable{
    
}

// -----------------------------------------------------------------

@end

@implementation EnemyBattery

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void)addBatteryBullet{
    
}
- (void)reSetNonFireable{
    
}

- (void)stopAndClear{
    
}

// -----------------------------------------------------------------

@end

@implementation EnemyDarkCloud

// -----------------------------------------------------------------

+ (instancetype)node
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    NSAssert(self, @"Unable to create class %@", [self class]);
    // class initalization goes here
    
    
    
    
    return self;
}

- (void)addLighting{
    
}
- (void)reSetDropable{
    
}
- (void)reSetNormal{
    
}

// -----------------------------------------------------------------

@end




