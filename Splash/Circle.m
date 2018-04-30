//
//  Circle.m
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import "Circle.h"

@implementation Circle

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
    
    NSColor* curr_color = [NSColor whiteColor];
    [curr_color set];
    [path fill];
}

@end
