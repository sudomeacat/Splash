//
//  Circle.m
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import "Circle.h"

@implementation Circle

unsigned short mode;
float r;
float g;
float b;

- (instancetype)initWithOrigin:(NSPoint)origin Angle:(double)angle {
    self = [super init];
    if (self) {
        self.origin = origin;
        self.angle = angle;
        self.radius = 0;
    }
    return self;
}

- (void)transformWithMagnitude:(double)magnitude {
    self.origin = NSMakePoint(self.origin.x + magnitude*sin(self.angle), self.origin.y + magnitude*cos(self.angle));
}

- (void) draw {
    NSBezierPath *path;
    
    NSRect rect;
    rect.size = NSMakeSize(self.radius, self.radius);
    rect.origin = NSMakePoint(self.origin.x - self.radius/2., self.origin.y - self.radius/2.);
    path = [NSBezierPath bezierPathWithOvalInRect:rect];
    
    [self nextColor:0.05];
    NSColor* curr_color = [NSColor colorWithRed:r/255.
                                          green:g/255.
                                           blue:b/255.
                                          alpha:1.0];
    [curr_color set];
    [path fill];
}

- (void) nextColor:(float)increment {
    switch (mode) {
    case 0:
        r-=increment;
        g+=increment;
        if (g > 255) {
            g = 255;
            r = 0;
            mode = 1;
        }
        break;
    case 1:
        g-=increment;
        b+=increment;
        if (b > 255) {
            b = 255;
            g = 0;
            mode = 2;
        }
        break;
    case 2:
        b-=increment;
        r+=increment;
        if (r > 255) {
            r = 255;
            b = 0;
            mode = 0;
        }
        break;
    }
}

@end
