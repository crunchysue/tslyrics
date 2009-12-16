//
//  TaylorSwiftAppDelegate.m
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "TaylorSwiftAppDelegate.h"
#import "MainViewController.h"

@implementation TaylorSwiftAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application { 
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
