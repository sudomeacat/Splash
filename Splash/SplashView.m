//
//  SplashView.m
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import "SplashView.h"

@implementation SplashView

const double PI = 3.1415926536;
const double MIN_RADIUS = 5.;
const double MAX_RADIUS = 30.;
const double WHEEL_RADIUS = 50.;

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        NSPoint center = NSMakePoint([self bounds].size.width/2., [self bounds].size.height/2.);
        
        self.circles = [[NSMutableArray alloc] initWithCapacity:89];
        [self.circles addObject:[[Circle alloc] initWithOrigin:center
                                                          Ring:0
                                                         Angle:0]];
        for (int i = 1; i < 9; i++) {
            double inner = i*PI/4; //i*2pi/8
            [self.circles addObject: [[Circle alloc] initWithOrigin:NSMakePoint(WHEEL_RADIUS*sin(inner) + center.x, WHEEL_RADIUS*cos(inner) + center.y)
                                                               Ring:1
                                                              Angle:inner]];
        }
        
        for (int i = 0 ; i < 16; i++) {
            for (int j = 2; j < 7; j++) {
                double inner = i*PI/8 + (j % 2 ? 0 : PI/16); //i*2pi/16
                [self.circles addObject:[[Circle alloc] initWithOrigin:NSMakePoint(WHEEL_RADIUS*j*sin(inner) + center.x, WHEEL_RADIUS*j*cos(inner) + center.y)
                                                                  Ring:j
                                                                 Angle:inner]];
            }
        }
        
        self.count = 0;
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation {
    [super startAnimation];
}

- (void)stopAnimation {
    [super stopAnimation];
}

#pragma mark -- Artwork

- (void)drawRect:(NSRect)rect {
    [super drawRect:rect];
    
    for (Circle* current in self.circles) {
        [current transformWithMagnitude:current.ring*sin(0.35*current.ring+self.count)];
        current.radius = ((MAX_RADIUS-MIN_RADIUS)/2) * cos(self.count+current.ring) + (MAX_RADIUS+MIN_RADIUS)/2;
        [current draw:YES];
    }
    
    self.count+=0.1;
}

- (void)animateOneFrame {
    [self drawRect:[self bounds]];
}

#pragma mark -- Configure Sheet Initialization

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow*)configureSheet {
    return nil;
}

@end
