//
//  MMAppLovingManager.h
//
//  Created by Michael Murray on 12/27/13.
//  Copyright (c) 2013 AppVenturous LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAppLovin : NSObject

+ (MMAppLovin *)shared;
- (void)showInterstitial;
- (void)cacheInterstitial;

@end
