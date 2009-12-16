//
//  FlipsideViewController.m
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "FlipsideViewController.h"
#import "TaylorSwiftAppDelegate.h"


@implementation FlipsideViewController

@synthesize delegate;
@synthesize songTitle;
@synthesize navItem;
@synthesize songTitleLabel;
@synthesize playPauseButton;
@synthesize musicPlayer;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];   
	[self loadURL];
//	self.navItem.title = self.songTitle;
	self.songTitleLabel.text = self.songTitle;
		
	self.musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
	
	
	[self updatePlayState];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector: @selector (playbackStateChanged:) 
												 name:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" 
											   object:musicPlayer];
	
	[[MPMusicPlayerController iPodMusicPlayer] beginGeneratingPlaybackNotifications];
	

}


- (IBAction) showSplashView {
	
	NSLog(@"showing splash");
	
	SplashViewController *controller = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}

- (void)splashViewControllerDidFinish:(SplashViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
	
}


- (void)playSong {
	
	NSLog(@"Playing Song: %@", self.songTitle);
	
	MPMediaPropertyPredicate *artistNamePredicate =
    [MPMediaPropertyPredicate predicateWithValue: @"Taylor Swift"
                                     forProperty: MPMediaItemPropertyArtist];
	
	MPMediaPropertyPredicate *songNamePredicate =
    [MPMediaPropertyPredicate predicateWithValue: self.songTitle
                                     forProperty: MPMediaItemPropertyTitle];
	
	MPMediaQuery *myComplexQuery = [[MPMediaQuery alloc] init];
	
	[myComplexQuery addFilterPredicate: artistNamePredicate];
	[myComplexQuery addFilterPredicate: songNamePredicate];
	
	//MPMusicPlayerController *appMusicPlayer = [MPMusicPlayerController applicationMusicPlayer];	
	[self.musicPlayer setRepeatMode: MPMusicRepeatModeOne];

	[self.musicPlayer setQueueWithQuery: myComplexQuery];

	[self.musicPlayer play];
	
	[myComplexQuery release];
	
}


#pragma mark notification callbacks

-(void) playbackStateChanged: (NSNotification*) notification {
	NSLog(@"Just got notified that playback changed");
	[self updatePlayState];
}

- (IBAction) handlePlayPauseTapped {
	
	if (self.musicPlayer.playbackState == MPMusicPlaybackStatePlaying) {
		[self.musicPlayer pause];
	} else if (self.musicPlayer.playbackState == MPMusicPlaybackStateStopped) {
		[self playSong];
	} else {
		[self.musicPlayer play];
	}
}

- (void) updatePlayState {
//	if (self.musicPlayer.playbackState == MPMusicPlaybackStatePlaying) {
//		NSLog(@"in updatePlayState, state is PLAYING");
//        [self.playPauseButton setBackgroundImage:[UIImage imageNamed:@"smallPlayButton.png"] forState:UIControlStateNormal];
//    }
//    else {
//        [self.playPauseButton setBackgroundImage:[UIImage imageNamed:@"smallPauseButton.png"] forState:UIControlStateNormal];
//		NSLog(@"in updatePlayState, state is NOT PLAYING");
//    }
}

- (void) stopSong {
	//MPMusicPlayerController *appMusicPlayer = [MPMusicPlayerController applicationMusicPlayer];
	[self.musicPlayer stop];
}


- (IBAction)done {
	[self stopSong];
	[self.delegate flipsideViewControllerDidFinish:self];	
}



 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return YES;
 }
 

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	[self stopSong];
}


- (void)dealloc {
    [super dealloc];
}



-(void) loadURL {
	
	NSURL *url = NULL;
	
	// html files are the same as the song titles, without spaces and without apostrophes
	NSString *filename = [self.songTitle stringByReplacingOccurrencesOfString:@" " withString:@""];
	filename = [filename stringByReplacingOccurrencesOfString:@"'" withString:@""];
	filename = [filename stringByReplacingOccurrencesOfString:@"(" withString:@""];
	filename = [filename stringByReplacingOccurrencesOfString:@")" withString:@""];
	
	NSLog(@"filename = %@", filename);
	
	// find the page in bundle
	NSString *thePath =
	[[NSBundle mainBundle] pathForResource:filename 
									ofType:@"html"];
	url = [[NSURL alloc] initFileURLWithPath: thePath];
	
	if (url != NULL) {
		NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
		[webView loadRequest: request];
		[request release];
		[url release];
		
	}
}

@end
