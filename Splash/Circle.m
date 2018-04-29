//
//  Circle.m
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import "Circle.h"

@implementation Circle

bool BR;
bool RG;
bool GB;

- (instancetype)initWithOrigin:(NSPoint)origin Ring:(int)ring Angle:(double)angle {
    self = [super init];
    if (self) {
        self.origin = origin;
        self.angle = angle;
        self.radius = 0;
        self.ring = ring;
        self.color = 0x0000FF;
        BR = RG = 0;
        GB = 1;
    }
    return self;
}

- (instancetype)initWithOrigin:(NSPoint)origin Ring:(int)ring Angle:(double)angle Color:(int)color {
    self = [super init];
    if (self) {
        self.origin = origin;
        self.angle = angle;
        self.radius = 0;
        self.ring = ring;
        self.color = color;
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
    
    [self updateColor:3];
    NSColor *curr_color = [NSColor colorWithRed:(float)((self.color & 0xFF0000) >> 16)/255.
                                          green:(float)((self.color & 0x00FF00) >>  8)/255.
                                           blue:(float)((self.color & 0x0000FF) >>  0)/255.
                                          alpha:1];
    [curr_color set];
    [path fill];
}

- (void)updateColor:(int)increment {
    if (BR) {
        self.color += 0x000001 * increment;
        self.color -= 0x010000 * increment;
        if (((self.color & 0x0000FF) >> 0) >= 255) {
            BR = 0;
            RG = 1;
        }
    }
    else if (RG) {
        self.color += 0x010000 * increment;
        self.color -= 0x000100 * increment;
        if (((self.color & 0xFF0000) >> 16) >= 255) {
            RG = 0;
            GB = 1;
        }
    }
    else if (GB) {
        self.color += 0x000100 * increment;
        self.color -= 0x000001 * increment;
        if (((self.color & 0x00FF00) >> 8) >= 255) {
            GB = 0;
            BR = 1;
        }
    }
}

@end
