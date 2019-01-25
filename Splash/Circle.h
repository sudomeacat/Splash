//
//  Circle.h
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <math.h>

@interface Circle : NSObject

@property (readwrite, nonatomic) NSPoint origin;
@property (readwrite, nonatomic) double radius;
@property (readwrite, nonatomic) double angle;
@property (readwrite, nonatomic) NSColor* color;

- (instancetype)initWithOrigin:(NSPoint)origin Angle:(double)angle;
- (instancetype)initWithOrigin:(NSPoint)origin Angle:(double)angle Green:(float)green;
- (void)transformWithMagnitude:(double)magnitude;
- (void)draw;

@end
