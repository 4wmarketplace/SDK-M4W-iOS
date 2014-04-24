//
//  ADGView.h
//  ADGTest
//
//  Created by Costantino Pistagna on 6/25/12.
//  Copyright (c) 2012 Neodata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef enum adAnimationsType {
    kAdAgioSlideFromLeftToRight,
    kAdAgioSlideFromRightToLeft,
    kAdAgioSlideFromBottomToTop,
    kAdAgioSlideFromTopToBottom,
    kAdAgioAlphaAppear,
    kAdAgioAlphaDisappear
} adAnimationsType;

@interface ADGView : UIWebView <UIWebViewDelegate, UIGestureRecognizerDelegate>
- (void)setBaseURL:(NSString *)anURL;
- (void)loadRequest;
- (void)loadInterstitial;
- (void)setPositionID:(NSString *)aPositionID;
- (void)setClientID:(NSUInteger)anInt;
- (void)setKeywords:(NSString *)kws;
- (id)initWithFrame:(CGRect)frame gpsEnabled:(BOOL)gpsSwitch interstitial:(BOOL)aValue;

@property(nonatomic) unsigned int refreshRate;
@property(nonatomic) BOOL useModalBrowser;
@property(nonatomic) BOOL gpsEnabled;
@property(nonatomic) BOOL disappearEnabled;
@property(nonatomic, assign) id adgDelegate;
@property(nonatomic, retain) NSMutableDictionary *advInfo;
@end




@protocol ADGViewDelegate <NSObject>

// Your Custom Event object call this when it need to know when ad ADGView did disappear.
- (void)ADGViewDidDisappear:(ADGView *)anADGView;

// Your Custom Event object call this when it need to know when ad ADGView did appear.
- (void)ADGViewDidAppear:(ADGView *)anADGView;

// Your Custom Event object must call this when it receives or creates an ad
// view.
- (void)ADGViewDidReceiveAd:(ADGView *)anADGView;

// Your Custom Event object must call this when it fails to receive or
// create the ad view. Pass along any error object sent from the ad network's
// SDK, or an NSError describing the error. Pass nil if not available.
- (void)ADGViewDidFailAd:(NSError *)anError;

// Your Custom Event object should call this when the user touches or "clicks"
// the ad to initiate an action. When the SDK receives this callback, it reports
// the click back to the Mediation server. This callback is optional.
- (void)ADGViewClickDidOccurInAd:(ADGView *)anADGView;

// Your Custom Event object should call this when the user "clicks" shrinking a banner
- (void)ADGViewDidShrinked:(ADGView *)anADGView;

// Your Custom Event object should call this when the user "clicks" expanding a banner
// toSize includes the newsize that will used when expanded
- (void)ADGViewWillExpand:(ADGView *)anADGView toSize:(CGSize)newSize;

// Your Custom Event object should call this when the user expanded a banner
// toSize includes the newsize expanded
- (void)ADGViewDidExpanded:(ADGView *)anADGView toSize:(CGSize)newSize;

// Your Custom Event object should call this when the user "clicks" shrinking a banner
// toSize includes the newsize shrinked
- (void)ADGViewDidShrinked:(ADGView *)anADGView toSize:(CGSize)newSize;


@end
