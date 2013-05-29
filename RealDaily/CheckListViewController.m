//
//  CheckListViewController.m
//  RealDaily
//
//  Created by bluemol on 5/1/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "CheckListViewController.h"
#import "ThemeManager.h"
#import "CheckListViewCell.h"

#import "EvernoteSession.h"
#import "EvernoteUserStore.h"
#import "EvernoteNoteStore.h"

#define NOTE_CONTENTS @"<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\"><en-note>Hello, world! %@  <br/><en-todo/>An item that I haven't completed yet.<br/> <en-todo checked=\"true\"/>An item that I haven't completed yet2.<br/>    </en-note>"

@interface CheckListViewController ()

@end

@implementation CheckListViewController

- (void)navRightBtnClick
{
    NSLog(@"hello world");
    
    EvernoteNoteStore *noteStore = [EvernoteNoteStore noteStore];
    EDAMNote *note = [[EDAMNote alloc] init];
    [note setTitle:@"Hello Evernote"];
    [note setContent:[[NSString alloc] initWithFormat:NOTE_CONTENTS, @"I'm A longteam"]];
    NSString *guid = [[NSUserDefaults standardUserDefaults] stringForKey:@"notebook_guid"];
    [note setNotebookGuid:guid];

    
    
    [noteStore createNote:note success:^(EDAMNote *note) {
        NSLog(@"Received note guid: %@", [note guid]);
    }failure:^(NSError *error) {
        NSLog(@"Create note failed: %@", error);
    }];
    
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        NSLog(@"tableview init");
        

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"checklist view did load");
    
    
    // Apply Check List Theme
    [[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"cl-menu-bar.png" backButtonImage:@"cl-back-button.png" settingButtonImage:@"cl-settings-button.png" barButtonImage:@"cl-bar-button.png" viewController:self];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu-background.png"]];

 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 1) {
        return 50.0;
    }
    else {
        return 10.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.row % 2 == 1) {
        
        static NSString *CellIdentifier = @"CheckListCell";
        CheckListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        // Configure the cell...
        
        if (!cell) {
            cell = [[CheckListViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.userInteractionEnabled = YES;
        
        return cell;
    }
    else {
        static NSString *CellIdentifier = @"SpaceCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        // Configure the cell...
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.backgroundColor = [UIColor clearColor];
        }
        
        cell.userInteractionEnabled = NO;
        
        return cell;
    }
    
    
    /*
     if (indexPath.row % 2 == 0) {
     cell.selectionStyle = UITableViewCellSelectionStyleBlue;
     }
     else {
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     }
     */
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
