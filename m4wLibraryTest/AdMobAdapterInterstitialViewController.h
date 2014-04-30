//
//  AdMobAdapterInterstitialController.h
//  skyrockettest
//
//  Created by Carmine La Valle on 01/02/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADInterstitial.h"
#import "GADInterstitialDelegate.h" 

@interface AdMobAdapterInterstitialViewController : UIViewController <GADInterstitialDelegate> {
    GADInterstitial *interstitial_;
}

@property (strong, nonatomic) IBOutlet UITextField *tfAdunitId;

- (IBAction)attivaButtonPressed:(id)sender;

@end
