//
//  MMAppLovingManager.m
//
//  Created by Michael Murray on 12/27/13.
//  Copyright (c) 2013 AppVenturous LLC. All rights reserved.
//

#import "MMAppLovin.h"
#import "ALSdk.h"
#import "ALInterstitialAd.h"

@interface MMAppLovin () <ALAdLoadDelegate>

@property (nonatomic, strong) ALAd *cachedAd;

@end

@implementation MMAppLovin

#pragma mark - Init

+ (MMAppLovin *)shared
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[MMAppLovin alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        [ALSdk initializeSdk];
    }
    return self;
}

#pragma mark - The good stuff

- (void)showInterstitial
{
    if (self.cachedAd) {
        ALInterstitialAd *inter = [[ALInterstitialAd alloc] initInterstitialAdWithSdk:[ALSdk shared]];
        [inter showOver:[[UIApplication sharedApplication] keyWindow] andRender:self.cachedAd];
        self.cachedAd = nil;
    } else {
        [ALInterstitialAd showOver:[[UIApplication sharedApplication] keyWindow]];
    }
}

- (void)cacheInterstitial
{
    [[[ALSdk shared] adService] loadNextAd:[ALAdSize sizeInterstitial] andNotify:self];
}

#pragma mark - ALAdLoadDelegate

- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad
{
    if (ad) {
        self.cachedAd = ad;
    }
}

- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    // Failed
    self.cachedAd = nil;
}

@end
