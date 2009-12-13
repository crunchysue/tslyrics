//
//  TaylorSwiftAppDelegate.h
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

@class MainViewController;

@interface TaylorSwiftAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

