//
//  Ring.h
//  Splash
//
//  Created by Krish Kalai on 4/29/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <math.h>
#import "Circle.h"

@interface Ring : NSObject

@property NSMutableArray* circles;
@property double transform_amplifier;

- (instancetype)initWithCount:(int)count Ring:(int)ring Offset:(double)offset Center:(NSPoint)center;
- (instancetype)initWithCount:(int)count Ring:(int)ring Offset:(double)offset Center:(NSPoint)center Green:(float)green;
- (void)transform:(double)t;
- (void)draw;

@end
