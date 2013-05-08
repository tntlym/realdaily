//
//  ThemeManager.h
//  RealDaily
//
//  Created by bluemol on 5/4/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject

- (void)applyThemeWithMenubarImage:(NSString*)menuBarImg backButtonImage:(NSString*)backBtnImg
                settingButtonImage:(NSString*)settingBtnImg barButtonImage:(NSString*)barBtnImg viewController:(UIViewController*)vc;

+ (ThemeManager *)sharedThemeManater;

@end
