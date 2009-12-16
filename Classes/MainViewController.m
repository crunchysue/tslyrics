//
//  MainViewController.m
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController

@synthesize curTitle;
@synthesize songListFearless;
@synthesize songListTaylorSwift;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
		self.songListTaylorSwift = [NSArray arrayWithObjects:
						 @"Tim McGraw", 
						 @"Picture To Burn",
						 @"Teardrops On My Guitar",
						 @"Cold As You",
						 @"The Outside",
						 @"Tied Together With A Smile",
						 @"Stay Beautiful",
						 @"Should've Said No",
						 @"Mary's Song",
						 @"Our Song",
						 @"I'm Only Me When I'm With You",
						 @"Invisible",
						 @"A Perfectly Good Heart",
						 nil];
		
		self.songListFearless = [NSArray arrayWithObjects:
						@"Jump Then Fall",
						@"Untouchable",
						@"Forever & Always (Piano Version)",
						@"Come In With The Rain",
						@"Superstar",
						@"The Other Side Of The Door",
						@"Fearless",
						@"Fifteen",
						@"Love Story",
						@"Hey Stephen",
						@"White Horse",
						@"You Belong With Me",
						@"Breathe",
						@"Tell Me Why",
						@"You're Not Sorry",
						@"The Way I Loved You",
						@"Forever & Always",
						@"The Best Day",
						@"Change",
						nil];
															
    }
    return self;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 [songsTable reloadData];	 
 }
 


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}



- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.songTitle = self.curTitle;
	
	NSLog(@"curTitle = %@", self.curTitle);
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
	
	
}

#pragma mark -
#pragma mark Table Callbacks



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// a required callback
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
	
	return section == 0 ? [songListFearless count] : [songListTaylorSwift count];
	
}


// a required callback
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	cell.textLabel.text = indexPath.section == 0 ? 
		[songListFearless objectAtIndex: indexPath.row] : 
		[songListTaylorSwift objectAtIndex:indexPath.row];

	
	return cell;
}

// a required callback
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
		
	self.curTitle = indexPath.section == 0 ? 
		[songListFearless objectAtIndex: indexPath.row] : 
		[songListTaylorSwift objectAtIndex:indexPath.row];
	
	
	[self showInfo];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// we could have used nil instead of the empty string
	return section == 0 ? @"Album: Fearless [Platinum Edition]" : @"Album: Taylor Swift [Premium Edition]";
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
	[songListFearless release];
	[songListTaylorSwift release];
}


@end
