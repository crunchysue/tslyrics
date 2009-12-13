//
//  FlipsideViewController.m
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;
@synthesize songTitle;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];   
	[self loadURL];
	self.navigationItem.title = self.songTitle;

}


- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}



-(void) loadURL {
	
	NSURL *url = NULL;
	
	// html files are the same as the song titles, without spaces
	// [NSCharacterSet whitespaceAndNewlineCharacterSet]
	NSString *filename = [self.songTitle stringByReplacingOccurrencesOfString:@" "
						  withString:@""];
	
	NSLog(@"filename = %@", filename);
	
	// find the about page in bundle
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
