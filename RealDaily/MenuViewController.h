//
//  MenuViewController.h
//  RealDaily
//
//  Created by bluemol on 5/8/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
