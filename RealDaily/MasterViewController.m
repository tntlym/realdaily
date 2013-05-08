//
//  MasterViewController.m
//  RealDaily
//
//  Created by bluemol on 5/8/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "MasterViewController.h"
#import "MenuViewController.h"

@interface MasterViewController ()



@end

@implementation MasterViewController



- (void)revealToggle:(id)sender {
    //MenuViewController *rearVC = (MenuViewController *)self.sidebarViewController;
    //[rearVC.searchBar resignFirstResponder];
    
    [super toggleSidebar:!self.sidebarShowing duration:kGHRevealSidebarDefaultAnimationDuration];
}

- (void)revealGesture:(UIPanGestureRecognizer *)recognizer {
    //MenuViewController *rearVC = (MenuViewController *)self.sidebarViewController;
    //[rearVC.searchBar resignFirstResponder];
    
    [super dragContentView:recognizer];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{

    
    [super viewWillAppear:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
    
    UIViewController *frontVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FrontVC"];
    UIViewController *rearVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RearVC"];
    
	frontVC.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:frontVC];
    
    self.contentViewController = nav;
    self.sidebarViewController = rearVC;
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
