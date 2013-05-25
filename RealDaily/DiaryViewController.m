//
//  DiaryViewController.m
//  RealDaily
//
//  Created by bluemol on 5/16/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "DiaryViewController.h"
#import "ThemeManager.h"
#import "AppDelegate.h"

@interface DiaryViewController () <UITextViewDelegate> {
    BOOL keyboardVisible;
    IBOutlet UITextView *diaryTextView;
    IBOutlet UIScrollView *scrollView;
}

@end

@implementation DiaryViewController

- (void)saveToPlistWithKey:(NSString *)key Value:(NSString *)value
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"realdaily.plist"];
    NSFileManager *fileMgr = [[NSFileManager alloc] init];
    
    //if ([fileMgr fileExistsAtPath:filePath]) {
        NSMutableDictionary *dictXmlInfo = [[NSMutableDictionary alloc] init];
        [dictXmlInfo setObject:value forKey:key];
        
        [dictXmlInfo writeToFile:filePath atomically:YES];
        dictXmlInfo = nil;
        fileMgr = nil;
    //}
}

- (NSString *)getPlistWithKey:(NSString *)key
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"realdaily.plist"];
    NSFileManager *fileMgr = [[NSFileManager alloc] init];
    
    NSString *text = @"";
    
    if ([fileMgr fileExistsAtPath:filePath]) {
        NSMutableDictionary *dictXmlInfo = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        text = [dictXmlInfo objectForKey:@"diary"];
        
        dictXmlInfo = nil;
        fileMgr = nil;
    }
    
    return text;
}

- (void)savePlist
{
    [self saveToPlistWithKey:@"diary" Value:diaryTextView.text];
}

- (void)keyboardDidShow: (NSNotification *)notif {
	if (keyboardVisible) {
		//NSLog(@"Keyboard is already visible. Ignoring notofication.");
		return;
	}
	
	//The keyboard wasn't visible before
	
	// Get the size of the keyboard.
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
	//resize the scroll view
	CGRect viewFrame = self.view.frame;
	viewFrame.size.height -= (keyboardSize.height);
	scrollView.frame = viewFrame;
    
    //[scrollView scrollRectToVisible:viewFrame animated:YES];

		
	keyboardVisible = YES;
}

- (void)keyboardDidHide: (NSNotification *)notif {
	
	
	NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	CGRect viewFrame = scrollView.frame;
	viewFrame.size.height += keyboardSize.height;
	scrollView.frame = viewFrame;
    //scrollView.contentSize = CGSizeMake(320, 758);

    //if (diaryTextView.contentSize.height > scrollView.contentSize.height) {
    //    scrollView.contentSize = diaryTextView.contentSize;
    //}
    
    
    //CGRect frame = diaryTextView.frame;
    //frame.size.height = diaryTextView.contentSize.height;
    //scrollView.frame = frame;
    /*
    scrollView.contentInset=UIEdgeInsetsMake(20.0,0.0,20.0,0.0);

    scrollView.contentSize = diaryTextView.contentSize;
	*/
	if (!keyboardVisible) {
		//NSLog(@"Keyboard is already hidden. Ignoring notification.");
		return;
	}
	
	keyboardVisible = NO;
	
}

- (void)navRightBtnClick
{

    [diaryTextView resignFirstResponder];
    [self savePlist];
    
    // TODO: save contents
}


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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
												 name: UIKeyboardDidShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
												 name: UIKeyboardDidHideNotification object:nil];
    
    // Apply Check List Theme
    [[ThemeManager sharedThemeManater] applyThemeWithMenubarImage:@"purple-menu-bar.png" backButtonImage:@"purple-back-button.png" settingButtonImage:@"purple-settings-button.png" barButtonImage:@"purple-bar-button.png" viewController:self];
    //diaryTextView.contentSize = CGSizeMake(320, 758);
    scrollView.contentInset=UIEdgeInsetsMake(1.0,0.0,1.0,0.0);
    //scrollView.scrollIndicatorInsets=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
    
    scrollView.contentSize = CGSizeMake(320, 758);
    diaryTextView.delegate = self;
    diaryTextView.text = [self getPlistWithKey:@"diary"];
    
    diaryTextView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diary_board.png"]];
    
	// Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    // Save content
    [self savePlist];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextView delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    //scrollView.scrollEnabled = NO;
    scrollView.contentInset=UIEdgeInsetsMake(0.0,0.0,0.0,0.0);

    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    //scrollView.scrollEnabled = YES;
    //scrollView.contentInset=UIEdgeInsetsMake(0.0,0.0,0.0,0.0);

}

- (void)textViewDidChange:(UITextView *)textView
{
    /*
    if (diaryTextView.contentSize.height > scrollView.contentSize.height) {
        scrollView.contentSize = diaryTextView.contentSize;
    }
    */
}


@end
