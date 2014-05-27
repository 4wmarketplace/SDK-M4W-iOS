//
//  M4WBannerViewController.m
//  skyrockettest
//
//  Created by Enrico Luciano on 26/01/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import "M4WBannerViewController.h"

@interface M4WBannerViewController ()

@property (nonatomic, strong) M4WView *m4wBanner;

@end

@implementation M4WBannerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        //iOS7 compatibility
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
	
    // Do any additional setup after loading the view, typically from a nib.
    // This frame will position the banner at the bottom/middle of our main view.
    
    self.tfIdentifier.text = @"67b1bf857bb9a0d246fb51d537d252c6";
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupM4WBanner];
}

- (IBAction)attivaButtonPressed:(id)sender {
    
    [self.tfIdentifier resignFirstResponder];
    [self setupM4WBanner];
}

-(void)setupM4WBanner {
    CGRect bannerFrame = CGRectMake(0, 0, 320, 50);
    NSLog(@"bannerFrame             %@", NSStringFromCGRect(bannerFrame));
    NSLog(@"self.vBannerZone frame  %@", NSStringFromCGRect(self.vBannerZone.frame));
    NSLog(@"self.vBannerZone bounds %@", NSStringFromCGRect(self.vBannerZone.bounds));
    
    // JSON M4W identifier
    NSDictionary *initDict = @{@"identifier":self.tfIdentifier.text,
                               @"bannerId":@"4wm_apt_ani_ios_ft",
                               @"intestitialId":@"4wm_apt_ani_ios_in"};
    
    self.m4wBanner = [[M4WView alloc] initWithFrame:self.vBannerZone.bounds
                                       interstitial:NO
                                           delegate:self
                                 rootViewController:self
                                         initParams:initDict];
    
    // Optionally, add a background color to ensure you have correctly positioned your banner
    [self.m4wBanner setBackgroundColor:[UIColor redColor]];
    
    self.m4wBanner.refreshRate = 40;
    
    // ensure that there are no other subviews in the bannerZone
    for (UIView *aView in self.vBannerZone.subviews) {
        [aView removeFromSuperview];
    }
    
    [self.vBannerZone addSubview:self.m4wBanner];
    NSLog(@"adding %@ to %@", self.m4wBanner, self.view);
}

- (IBAction)richiediButtonPressed:(id)sender {
    if (nil==self.m4wBanner) {
        return;
    }
    [self.m4wBanner loadRequest];
}

- (IBAction)failButtonPressed:(id)sender {
    
    [self.tfIdentifier resignFirstResponder];
    
    NSLog(@"%@ %@",NSStringFromClass(self.class), NSStringFromSelector(_cmd));
    
    NSError *fakeError = [NSError errorWithDomain:@"Fail" code:1 userInfo:nil];
    
    [self.m4wBanner performSelector:@selector(M4WAdapterDidFailAd:) withObject:fakeError];
    
    // [self.m4wBanner M4WAdapterDidFailAd:fakeError];
}

#pragma mark - M4W delegate

// Your Custom Event object call this when configuration fails
- (void)m4WView:(M4WView *)anM4WView configurationChanged:(NSDictionary *)configInfo{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
    
    NSMutableString *configurationString = [NSMutableString new];
    
    [configurationString appendString:configInfo[@"sdk"]];
    [configurationString appendString:@"\n"];
    [configurationString appendString:configInfo[@"appId"]];
    [configurationString appendString:@"\n"];
    [configurationString appendString:configInfo[@"adsId"]];
    
    self.lblConfigurationName.text = configurationString;
    
}

// Your Custom Event object call this when configuration changes
- (void)m4WView:(M4WView *)anM4WView configurationFailedWithError:(NSError *)anError {
    
    self.lblErrorMessage.text = anError.userInfo[@"ErrorMessage"];
}


// Your Custom Event object call this when it need to know when ad M4WView did disappear.
- (void)m4WViewDidDisappear:(M4WView *)anM4WView {
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object call this when it need to know when ad M4WView did appear.
- (void)m4WViewDidAppear:(M4WView *)anM4WView{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object must call this when it receives or creates an ad
// view.
- (void)m4WViewDidReceiveAd:(M4WView *)anM4WView{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
    
    self.lblErrorMessage.text = @"";
}

// Your Custom Event object must call this when it fails to receive or
// create the ad view. Pass along any error object sent from the ad network's
// SDK, or an NSError describing the error. Pass nil if not available.
- (void)m4WViewDidFailAd:(NSError *)anError{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object should call this when the user touches or "clicks"
// the ad to initiate an action. When the SDK receives this callback, it reports
// the click back to the Mediation server. This callback is optional.
- (void)m4WViewClickDidOccurInAd:(M4WView *)anM4WView{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object should call this when the user "clicks" shrinking a banner
- (void)m4WViewDidShrinked:(M4WView *)anM4WView{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object should call this when the user "clicks" expanding a banner
// toSize includes the newsize that will used when expanded
- (void)m4WViewWillExpand:(M4WView *)anM4WView toSize:(CGSize)newSize{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object should call this when the user expanded a banner
// toSize includes the newsize expanded
- (void)m4WViewDidExpanded:(M4WView *)anM4WView toSize:(CGSize)newSize{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

// Your Custom Event object should call this when the user "clicks" shrinking a banner
// toSize includes the newsize shrinked
- (void)m4WViewDidShrinked:(M4WView *)anM4WView toSize:(CGSize)newSize{
    NSLog(@"M4WBannerViewController %@",NSStringFromSelector(_cmd));
}

@end
