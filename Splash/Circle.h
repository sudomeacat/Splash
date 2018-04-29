//
//  Circle.h
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface Circle : NSObject

@property NSPoint origin;
@property double radius;
@property double angle;
@property int ring;
@property int color;

- (instancetype)initWithOrigin:(NSPoint)origin Ring:(int)ring Angle:(double)angle;

- (void)transformWithMagnitude:(double)magnitude;

- (void)draw:(bool)update_color;

- (void)updateColor;

@end
