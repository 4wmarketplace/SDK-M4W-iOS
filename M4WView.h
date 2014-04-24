//
//  M4WView.h
//  skyrockettest
//
//  Created by Enrico Luciano on 25/01/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import <UIKit/UIKit.h>

@class M4WView;

@protocol M4WViewDelegate <NSObject>

// Your Custom Event object call this when configuration fails
- (void)m4WView:(M4WView *)anM4WView configurationChanged:(NSDictionary *)configInfo;

// Your Custom Event object call this when configuration changes
- (void)m4WView:(M4WView *)anM4WView configurationFailedWithError:(NSError *)anError;

// Your Custom Event object call this when it need to know when ad M4WView did disappear.
- (void)m4WViewDidDisappear:(M4WView *)anM4WView;

// Your Custom Event object call this when it need to know when ad M4WView did appear.
- (void)m4WViewDidAppear:(M4WView *)anM4WView;

// Your Custom Event object must call this when it receives or creates an ad
// view.
- (void)m4WViewDidReceiveAd:(M4WView *)anM4WView;

// Your Custom Event object must call this when it fails to receive or
// create the ad view. Pass along any error object sent from the ad network's
// SDK, or an NSError describing the error. Pass nil if not available.
- (void)m4WViewDidFailAd:(NSError *)anError;

// Your Custom Event object should call this when the user touches or "clicks"
// the ad to initiate an action. When the SDK receives this callback, it reports
// the click back to the Mediation server. This callback is optional.
- (void)m4WViewClickDidOccurInAd:(M4WView *)anM4WView;

// Your Custom Event object should call this when the user "clicks" shrinking a banner
- (void)m4WViewDidShrinked:(M4WView *)anM4WView;

// Your Custom Event object should call this when the user "clicks" expanding a banner
// toSize includes the newsize that will used when expanded
- (void)m4WViewWillExpand:(M4WView *)anM4WView toSize:(CGSize)newSize;

// Your Custom Event object should call this when the user expanded a banner
// toSize includes the newsize expanded
- (void)m4WViewDidExpanded:(M4WView *)anM4WView toSize:(CGSize)newSize;

// Your Custom Event object should call this when the user "clicks" shrinking a banner
// toSize includes the newsize shrinked
- (void)m4WViewDidShrinked:(M4WView *)anM4WView toSize:(CGSize)newSize;

@end

@interface M4WView : UIView {
    unsigned int refreshRate;
}

@property(nonatomic) unsigned int refreshRate;
@property(nonatomic, weak) id<M4WViewDelegate> m4WViewDelegate;

- (void)loadRequest;
- (void)loadInterstitial;

- (id)initWithFrame:(CGRect)frame
       interstitial:(BOOL)isInterstitial
           delegate:(id<M4WViewDelegate>)delegate
 rootViewController:(UIViewController *)rootViewcontroller
         initParams:(NSDictionary *)initParams;

@end
