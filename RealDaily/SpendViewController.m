//
//  SpendViewController.m
//  RealDaily
//
//  Created by bluemol on 5/29/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "SpendViewController.h"
#import "ThemeManager.h"

@interface SpendViewController ()

@end

@implementation SpendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
        [[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"cl-menu-bar.png" backButtonImage:@"cl-back-button.png" settingButtonImage:@"cl-settings-button.png" barButtonImage:@"cl-bar-button.png" viewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
