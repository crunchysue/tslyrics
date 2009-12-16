//
//  FlipsideViewController.h
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "SplashViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController <SplashViewControllerDelegate> {
	id <FlipsideViewControllerDelegate> delegate;
	IBOutlet UIWebView *webView;
	IBOutlet UINavigationItem *navItem;
	IBOutlet UILabel *songTitleLabel;
	IBOutlet UIButton *playPauseButton;
	NSString *songTitle;
	MPMusicPlayerController *musicPlayer;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString *songTitle;
@property (nonatomic, retain) UINavigationItem *navItem;
@property (nonatomic, retain) UILabel *songTitleLabel;
@property (nonatomic, retain) UIButton *playPauseButton;
@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;


- (IBAction)done;
- (void) loadURL;
- (IBAction) playSong;
- (IBAction) stopSong;
- (IBAction) showSplashView;
- (IBAction) handlePlayPauseTapped;
- (void) updatePlayState;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

