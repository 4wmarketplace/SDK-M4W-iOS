//
//  AdMobAdapterInterstitialViewController.m
//  skyrockettest
//
//  Created by Carmine La Valle on 01/02/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import "AdMobAdapterInterstitialViewController.h"

@interface AdMobAdapterInterstitialViewController ()

@end

@implementation AdMobAdapterInterstitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        //iOS7 compatibility
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [super viewDidLoad];
    
    self.tfAdunitId.text = @"ca-app-pub-1248321676074385/6726390352";
    
}

- (IBAction)attivaButtonPressed:(id)sender {
    
    [self.tfAdunitId resignFirstResponder];
    
    interstitial_ = [[GADInterstitial alloc] init];
    interstitial_.adUnitID = self.tfAdunitId.text;
    [interstitial_ loadRequest:[GADRequest request]];
    interstitial_.delegate = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ GAD_SIMULATOR_ID ];
    
    // Initiate a generic request to load it with an ad.
    [interstitial_ loadRequest: request];
    
}

-(void)interstitialDidReceiveAd:(GADInterstitial *)interstitial{
    [interstitial presentFromRootViewController:self];
}

@end
