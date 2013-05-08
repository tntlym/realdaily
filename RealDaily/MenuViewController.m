//
//  MenuViewController.m
//  RealDaily
//
//  Created by bluemol on 5/8/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) NSIndexPath   *currentSelection;

@end

@implementation MenuViewController

@synthesize tableView;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
