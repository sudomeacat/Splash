//
//  SplashView.m
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//
 
#import "SplashView.h"

@implementation SplashView

- (instancetype)initWithFrame:(NSRect) frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        NSPoint center = NSMakePoint([self bounds].size.width/2., [self bounds].size.height/2.);
        
        self.rings = [[NSMutableArray alloc] initWithObjects: [[Ring alloc] initWithCount:1 Ring:0 Offset:0 Center:center Green:0.],
                      [[Ring alloc] initWithCount:8 Ring:1 Offset:0 Center:center Green:1/8],
                      [[Ring alloc] initWithCount:16 Ring:2 Offset:M_PI/16 Center:center Green:2/8],
                      [[Ring alloc] initWithCount:16 Ring:3 Offset:0 Center:center Green:3/8],
                      [[Ring alloc] initWithCount:16 Ring:4 Offset:M_PI/16 Center:center Green:4/8],
                      [[Ring alloc] initWithCount:16 Ring:5 Offset:0 Center:center Green:5/8],
                      [[Ring alloc] initWithCount:16 Ring:6 Offset:M_PI/16 Center:center Green:6/8],
                      [[Ring alloc] initWithCount:16 Ring:7 Offset:0 Center:center Green:7/8],
                      nil];
        
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

#pragma mark - Artwork

- (void)drawRect:(NSRect)rect {
    [super drawRect:rect];
    [[[Circle alloc] initWithOrigin:NSMakePoint(self.count, self.count) Angle:0] draw];
    for (Ring* ring in self.rings) {
        [ring transform:self.count];
        [ring draw];
    }
    
    self.count+=0.1;
}

- (void)animateOneFrame {
    [self setNeedsDisplay:true];
    //[self drawRect:[self bounds]];
}

#pragma mark - Configure Sheet Initialization

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow*)configureSheet {
    return nil;
}

@end
