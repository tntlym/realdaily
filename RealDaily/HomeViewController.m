//
//  ViewController.m
//  RealDaily
//
//  Created by bluemol on 5/1/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "HomeViewController.h"
#import "ThemeManager.h"
#import "MenuViewController.h"

#import "AppDelegate.h"
#import "EvernoteSession.h"
#import "EvernoteUserStore.h"
#import "EvernoteNoteStore.h"


@interface HomeViewController () {
    IBOutlet UIButton *cl;
    IBOutlet UIButton *memo;
    IBOutlet UIButton *diary;
    IBOutlet UIButton *share;
    
}

@property (strong, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;


@end

@implementation HomeViewController

@synthesize navigationBarPanGestureRecognizer;



- (IBAction)cl:(id)sender
{
    NSLog(@"checkLIst");
}

- (IBAction)memo:(id)sender
{
    NSLog(@"memo");
    
    /*
    EDAMNotebook* notebook = [[EDAMNotebook alloc] initWithGuid:nil name:@"Real Daily" updateSequenceNum:0 defaultNotebook:NO serviceCreated:0 serviceUpdated:0 publishing:nil published:NO stack:nil sharedNotebookIds:nil sharedNotebooks:nil businessNotebook:nil contact:nil restrictions:nil];
    
    EvernoteNoteStore *noteStore = [EvernoteNoteStore noteStore];

    
    [noteStore createNotebook:notebook success:^(EDAMNotebook *notebook)
    {
        NSData *NewdataHash = [NewFileData md5];
        EDAMData *NewedamData = [[EDAMData alloc] initWithBodyHash:NewdataHash size:NewFileData.length body:NewFileData];
        EDAMResource* Newresource = [[EDAMResource alloc] initWithGuid:nil noteGuid:nil data:NewedamData mime:@"application/csv" width:0 height:0 duration:0 active:0 recognition:0 attributes:nil updateSequenceNum:0 alternateData:nil];
        NSString *NewnoteContent = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                                    "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"
                                    "<en-note>"
                                    "<span style=\"font-weight:bold;\">CountDown DairiesList.</span>"
                                    "<br />"
                                    "<span>Evernote logo :</span>"
                                    "<br />"
                                    "%@"
                                    "</en-note>",[ENMLUtility mediaTagWithDataHash:NewdataHash mime:@"application/csv"]];
        
        NSMutableArray* Newresources = [NSMutableArray arrayWithArray:@[Newresource]];
        EDAMNote *newNote = [[EDAMNote alloc] initWithGuid:notebook.guid title:titileString content:noteContent contentHash:nil contentLength:noteContent.length created:0 updated:0 deleted:0 active:YES updateSequenceNum:notebook.updateSequenceNum notebookGuid:notebook.guid tagGuids:nil resources:resources attributes:nil tagNames:nil];
        
        [[EvernoteNoteStore noteStore] createNote:newNote success:^(EDAMNote *note)
         {
             NSLog(@"Note created successfully.");
             
             
         } failure:^(NSError *error) {
             NSLog(@"Error creating note : %@",error);
         }];
        
        
    }
                      failure:^(NSError *error)
     {
         
         NSLog(@"Error : %@",error);
     }];
     */
}

- (IBAction)diary:(id)sender
{
    NSLog(@"diary");
    /*
    if([[EvernoteSession sharedSession] isEvernoteInstalled]) {
        // Invoke Evernote for iOS related function
    }
    else {
        // Prompt user to install the app
        [[EvernoteSession sharedSession] installEvernoteAppUsingViewController:self];
    }
    */
}

- (IBAction)share:(id)sender
{
    NSLog(@"share");
    /*
    EvernoteSession *session = [EvernoteSession sharedSession];
    NSLog(@"Session host: %@", [session host]);
    NSLog(@"Session key: %@", [session consumerKey]);
    NSLog(@"Session secret: %@", [session consumerSecret]);
    
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated){
            if (error) {
                NSLog(@"Error authenticating with Evernote Cloud API: %@", error);
            }
            if (!session.isAuthenticated) {
                NSLog(@"Session not authenticated");
            }
        } else {
            // We're authenticated!
            EvernoteUserStore *userStore = [EvernoteUserStore userStore];
            [userStore getUserWithSuccess:^(EDAMUser *user) {
                // success
                NSLog(@"Authenticated as %@", [user username]);
            } failure:^(NSError *error) {
                // failure
                NSLog(@"Error getting user: %@", error);
            } ];
        }
    }];
     */
}


- (void)createEvernoteNotebook
{
    EvernoteNoteStore *noteStore = [EvernoteNoteStore noteStore];
    NSString *guid = [[NSUserDefaults standardUserDefaults] stringForKey:@"notebook_guid"];
    NSLog(@"precheck guid: %@", guid);
    
    [noteStore getNotebookWithGuid:guid success:^(EDAMNotebook *notebook) {
        NSLog(@"notebook exist!");
    } failure:^(NSError *error){
        // create RealDaily Notebook if it doesn't exist
        EDAMNotebook *notebook = [[EDAMNotebook alloc]init];
        notebook.name = @"RealDaily";
        [noteStore createNotebook:notebook success:^(EDAMNotebook *notebook){
            NSLog(@"create real daily notebook ok!");
            NSLog(@"GUID:%@", notebook.guid);
            
            [[NSUserDefaults standardUserDefaults] setObject:notebook.guid forKey:@"notebook_guid" ];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        } failure:^(NSError *error){
            NSLog(@"create real daily failed with %@", error);
        }];
    }];
}

- (void)evernoteLogin
{
    EvernoteSession *session = [EvernoteSession sharedSession];
    NSLog(@"Session host: %@", [session host]);
    NSLog(@"Session key: %@", [session consumerKey]);
    NSLog(@"Session secret: %@", [session consumerSecret]);
    
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated){
            if (error) {
                NSLog(@"Error authenticating with Evernote Cloud API: %@", error);
            }
            if (!session.isAuthenticated) {
                NSLog(@"Session not authenticated");
            }
        } else {
            // We're authenticated! Save User Name
            EvernoteUserStore *userStore = [EvernoteUserStore userStore];
            [userStore getUserWithSuccess:^(EDAMUser *user) {
                // success
                NSLog(@"Authenticated as %@", [user username]);
                [[NSUserDefaults standardUserDefaults] setObject:[user username] forKey:@"evernote_user_name" ];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                // Create "RealDaily" notebook
                [self createEvernoteNotebook];
                
                
            } failure:^(NSError *error) {
                // failure
                NSLog(@"Error getting user: %@", error);
            } ];
        }
    }];
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
    // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];

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
			UIImage *imageMenu = [UIImage imageNamed:@"setting_button.png"];
            UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [menuButton setImage:imageMenu forState:UIControlStateNormal];
            menuButton.frame = CGRectMake(0.0, 0.0, imageMenu.size.width, imageMenu.size.height);
            [menuButton addTarget:controller action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
            
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
		}
	}
    
    
    // Set up NavigationView
    
    //UIImage *menuBarImage = [UIImage imageNamed:@"bizapp-menubar"];
    UIImage *menuBarImage = [UIImage imageNamed:@"bizapp-menubar"];

    UIColor* titleColor = [UIColor colorWithRed:255.0f/255.0f green:253.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    

    
    [self.navigationController.navigationBar setBackgroundImage:menuBarImage forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor], UITextAttributeTextColor,
      [UIFont fontWithName:@"Arial" size:12.0f], UITextAttributeFont,
      nil] forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                   titleColor, UITextAttributeTextColor,
                                                                   [UIFont fontWithName:@"Avenir-Black" size:20.0f], UITextAttributeFont,
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
    [settingsButton addTarget:self action:@selector(evernoteLogin) forControlEvents:UIControlEventTouchUpInside];
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
