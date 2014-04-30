//
//  AdMobAdapterBannerController.h
//  skyrockettest
//
//  Created by Carmine La Valle on 01/02/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

@interface AdMobAdapterBannerViewController : UIViewController {
    GADBannerView *bannerView_;
}
@property (strong, nonatomic) IBOutlet UITextField *tfAdUnitId;
@property (strong, nonatomic) IBOutlet UIView *vBannerZone;

- (IBAction)attivaButtonPressed:(id)sender;
@end
