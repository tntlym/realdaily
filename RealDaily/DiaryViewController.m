//
//  DiaryViewController.m
//  RealDaily
//
//  Created by bluemol on 5/16/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "DiaryViewController.h"
#import "ThemeManager.h"

@interface DiaryViewController ()

@end

@implementation DiaryViewController

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
    NSLog(@"checklist view did load");
    
    // Apply Check List Theme
    [[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"purple-menu-bar.png" backButtonImage:@"purple-back-button.png" settingButtonImage:@"purple-settings-button.png" barButtonImage:@"purple-bar-button.png" viewController:self];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
