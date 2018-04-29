//
//  Circle.h
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface Circle : NSObject

@property (readwrite, nonatomic) NSPoint origin;
@property (readwrite, nonatomic) double radius;
@property (readwrite, nonatomic) double angle;
@property (readwrite, nonatomic) int ring;
@property (readwrite, nonatomic) int color;

- (instancetype)initWithOrigin:(NSPoint)origin Ring:(int)ring Angle:(double)angle;
- (void)transformWithMagnitude:(double)magnitude;
- (void)draw;
- (void)updateColor:(int)increment;

@end
