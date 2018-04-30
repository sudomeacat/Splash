//
//  SplashView.h
//  Splash
//
//  Created by Krish Kalai on 4/25/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <math.h>
#import "Ring.h"

@interface SplashView : ScreenSaverView

@property (readwrite, nonatomic) float count;
@property (readwrite, nonatomic) NSMutableArray *rings;

@end
