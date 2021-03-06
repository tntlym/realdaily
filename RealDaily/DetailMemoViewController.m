//
//  DetailMemoViewController.m
//  RealDaily
//
//  Created by Joey Liang on 5/25/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "DetailMemoViewController.h"
#import "ThemeManager.h"

@interface DetailMemoViewController ()

@end

@implementation DetailMemoViewController

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
    
    // Apply Check List Theme
    [[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"forrest-menu-bar.png" backButtonImage:@"forrest-back-button.png" settingButtonImage:@"forrest-settings-button.png" barButtonImage:@"forrest-bar-button.png" viewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
