//
//  ThemeManager.m
//  RealDaily
//
//  Created by bluemol on 5/4/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

- (id) init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

+ (ThemeManager *)sharedThemeManater
{
    static ThemeManager *themeManager;
    
    if (themeManager == nil) {
        themeManager = [[ThemeManager alloc] init];
    }
    
    return themeManager;
}

- (void)applyThemeWithMenubarImage:(NSString*)menuBarImg backButtonImage:(NSString*)backBtnImg
settingButtonImage:(NSString*)settingBtnImg barButtonImage:(NSString*)barBtnImg viewController:(UIViewController*)vc
{
    // add customized image
    UIImage *menuBarImage = [UIImage imageNamed:menuBarImg];
    UIImage *backButtonImage = [UIImage imageNamed:backBtnImg];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], UITextAttributeTextColor,
      [UIFont fontWithName:@"Arial" size:13.0f], UITextAttributeFont,
      nil] forState:UIControlStateNormal];
    

    
    [vc.navigationController.navigationBar setBackgroundImage:menuBarImage forBarMetrics:UIBarMetricsDefault];

    backButtonImage = [backButtonImage
                       resizableImageWithCapInsets:UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, -2.0f)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
        
    UIImage *settingsButtonImage = [UIImage imageNamed:settingBtnImg];
    UIImage *barButtonImage = [UIImage imageNamed:barBtnImg];
    
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingsButton.frame = CGRectMake(0.0f, 0.0f, settingsButtonImage.size.width, settingsButtonImage.size.height);
    [settingsButton setBackgroundImage:barButtonImage forState:UIControlStateNormal];
    //[settingsButton addTarget:view.window.rootViewController action:@selector(dismissController) forControlEvents:UIControlEventTouchUpInside];
    [settingsButton setImage:settingsButtonImage forState:UIControlStateNormal];
    
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];

}

@end
