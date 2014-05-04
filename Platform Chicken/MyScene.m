//
//  MyScene.m
//  Platform Chicken
//
//  Created by Robert Marchiori on 1/20/14.
//  Copyright (c) 2014 Robert Marchiori. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -2.0f);
        
        SKSpriteNode *landscape = [SKSpriteNode spriteNodeWithImageNamed:@"Background-L1"];
        landscape.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        landscape.zPosition = -100;
        landscape.xScale = 0.75;
        landscape.yScale = 0.75;
        
        SKSpriteNode *platform = [SKSpriteNode spriteNodeWithImageNamed:@"Platform-L1"];
        platform.position = CGPointMake(CGRectGetMidX(self.frame), 375);
        platform.zPosition = -99;
        platform.xScale = 0.75;
        platform.yScale = 0.75;
        platform.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(400, 220)];
        platform.physicsBody.dynamic = NO;
        
        [self addChild:landscape];
        [self addChild:platform];
        
        
        for (int i = 1; i<6; i++) {
             [self createStuffToThrow];
        }
       
    
    }
    return self;
}

-(void)createStuffToThrow {
    
    SKSpriteNode *Stuff = [SKSpriteNode spriteNodeWithImageNamed:@"Saucepan"];
    Stuff.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));
    Stuff.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(40,40)];
    Stuff.zPosition = 100;
    Stuff.physicsBody.mass = -1;
    Stuff.xScale = 0.2;
    Stuff.yScale = 0.2;
    
    [self addChild:Stuff];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Mutant-Chicken"];
        
        sprite.position = location;
        sprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:50];
        sprite.physicsBody.mass = 1000000;
        sprite.xScale = .75;
        sprite.yScale = .75;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
