MMAppLovin
==========

Wrapper class for the AppLovin SDK to simplfy interstitial caching with convenience methods (mimics Chartboost's clean and simple approach).

### Load Interstitial
```objective-c
-(void)cacheInterstitial;
```
### Show Interstitial

If a cache interstitial is available, display it. Otherwise load a fresh one and display it when ready.

```objective-c
- (void)showInterstitial;
```

