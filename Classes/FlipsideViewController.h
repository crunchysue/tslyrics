//
//  FlipsideViewController.h
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	IBOutlet UIWebView *webView;
	IBOutlet UINavigationItem *navItem;
	IBOutlet UILabel *songTitleLabel;
	NSString *songTitle;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString *songTitle;
@property (nonatomic, retain) UINavigationItem *navItem;
@property (nonatomic, retain) UILabel *songTitleLabel;

- (IBAction)done;
- (void) loadURL;
- (IBAction) playSong;
- (IBAction) stopSong;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

