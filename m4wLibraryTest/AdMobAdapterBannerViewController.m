//
//  AdMobAdapterBannerViewController.m
//  skyrockettest
//
//  Created by Carmine La Valle on 01/02/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import "AdMobAdapterBannerViewController.h"

@interface AdMobAdapterBannerViewController ()

@end

@implementation AdMobAdapterBannerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        //iOS7 compatibility
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [super viewDidLoad];
    
    self.tfAdUnitId.text = @"ca-app-pub-1248321676074385/5249657153";
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupAdMobBanner];
}

- (IBAction)attivaButtonPressed:(id)sender {
    
    [self.tfAdUnitId resignFirstResponder];
    [self setupAdMobBanner];
}

-(void)setupAdMobBanner {
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    // Specify the ad unit ID.
    bannerView_.adUnitID = self.tfAdUnitId.text;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    
    for (UIView *aView in self.vBannerZone.subviews) {
        [aView removeFromSuperview];
    }
    
    [self.vBannerZone addSubview:bannerView_];
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ GAD_SIMULATOR_ID ];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest: request];
}


@end
