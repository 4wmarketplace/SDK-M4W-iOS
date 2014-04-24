//
//  M4WBannerViewController.h
//  skyrockettest
//
//  Created by Enrico Luciano on 26/01/14.
//  Copyright (c) 2014 4WMarketPlace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "M4WView.h"

@interface M4WBannerViewController : UIViewController<M4WViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *vBannerZone;
@property (strong, nonatomic) IBOutlet UITextField *tfIdentifier;
@property (strong, nonatomic) IBOutlet UILabel *lblErrorMessage;
@property (strong, nonatomic) IBOutlet UILabel *lblConfigurationName;

- (IBAction)failButtonPressed:(id)sender;
- (IBAction)attivaButtonPressed:(id)sender;
- (IBAction)richiediButtonPressed:(id)sender;

@end
