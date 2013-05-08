//
//  ViewController.m
//  RealDaily
//
//  Created by bluemol on 5/1/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "ViewController.h"
#import "ThemeManager.h"
#import "MenuViewController.h"

@interface ViewController () {
    IBOutlet UIButton *cl;
    IBOutlet UIButton *memo;
    IBOutlet UIButton *diary;
    IBOutlet UIButton *share;
    
}

@property (strong, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;


@end

@implementation ViewController

@synthesize navigationBarPanGestureRecognizer;



- (IBAction)cl:(id)sender
{
    NSLog(@"checkLIst");
}

- (IBAction)memo:(id)sender
{
    NSLog(@"memo");
}

- (IBAction)diary:(id)sender
{
    NSLog(@"diary");
}

- (IBAction)share:(id)sender
{
    NSLog(@"share");
}


- (void)viewWillAppear:(BOOL)animated
{
    //[self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    // Apply Main View Theme
    //[[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"bizapp-menubar.png" backButtonImage:@"navigation-btn-menu.png" settingButtonImage:@"settings-button.png" barButtonImage:nil viewController:self];
    
    //[[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"menu-bar.png" backButtonImage:@"navigation-btn-menu.png" settingButtonImage:@"settings-button.png" barButtonImage:nil viewController:self];
    /*
    UIBarButtonItem* menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation-btn-menu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu:)];
    [menuButton setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    */
    
    // Set up slide menu view
    UINavigationController *nav = self.navigationController;
    UIViewController *controller = nav.parentViewController; // MainViewController : ZUUIRevealController
    if ([controller respondsToSelector:@selector(revealGesture:)] && [controller respondsToSelector:@selector(revealToggle:)])
	{
        // Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.view gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
			UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:controller action:@selector(revealGesture:)];
			self.navigationBarPanGestureRecognizer = panGestureRecognizer;
			
			[self.view addGestureRecognizer:self.navigationBarPanGestureRecognizer];
		}

		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem]) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerSelectedOption:) name:@"MenuSelectedOption" object:nil];
			// If not, allocate one and add it.
			UIImage *imageMenu = [UIImage imageNamed:@"navigation-btn-menu.png"];
            UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [menuButton setImage:imageMenu forState:UIControlStateNormal];
            menuButton.frame = CGRectMake(0.0, 0.0, imageMenu.size.width, imageMenu.size.height);
            [menuButton addTarget:controller action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
            
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
		}
	}
    
    
    // Set up NavigationView
    
    UIImage *menuBarImage = [UIImage imageNamed:@"menu-bar.png"];
    UIColor* titleColor = [UIColor colorWithRed:255.0f/255.0f green:253.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    

    
    [self.navigationController.navigationBar setBackgroundImage:menuBarImage forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], UITextAttributeTextColor,
      [UIFont fontWithName:@"Arial" size:13.0f], UITextAttributeFont,
      nil] forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                   titleColor, UITextAttributeTextColor,
                                                                   [UIFont fontWithName:@"Avenir-Black" size:23.0f], UITextAttributeFont,
                                                                   nil]];
    /*
    UIImage *btnImg = [UIImage imageNamed:@"navigation-btn-menu"];
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0.0f, 0.0f, btnImg.size.width, btnImg.size.height);
    [menuBtn setBackgroundImage:btnImg forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *mButton = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    */
    
    UIImage *settingsButtonImage = [UIImage imageNamed:@"settings-button.png"];
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingsButton.frame = CGRectMake(0.0f, 0.0f, settingsButtonImage.size.width, settingsButtonImage.size.height);
    //[settingsButton addTarget:view.window.rootViewController action:@selector(dismissController) forControlEvents:UIControlEventTouchUpInside];
    [settingsButton setImage:settingsButtonImage forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
    
    
    //[menuBtn setBackgroundImage:[UIImage imageNamed:@"cl-bar-menu.png"] forState:UIControlStateNormal];

    
    //self.navigationItem.leftBarButtonItem = mButton;
    
    [super viewWillAppear:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
