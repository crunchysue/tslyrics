//
//  SplashViewController.h
//  TaylorSwift
//
//  Created by Sue Brown on 12/15/09.
//  Copyright 2009 House of Crunchy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SplashViewControllerDelegate;

@interface SplashViewController : UIViewController {
	id <SplashViewControllerDelegate> delegate;

}

@property (nonatomic, assign) id <SplashViewControllerDelegate> delegate;

- (IBAction) closeSplash;

@end



@protocol SplashViewControllerDelegate
- (void)splashViewControllerDidFinish:(SplashViewController *)controller;
@end
