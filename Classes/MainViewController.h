//
//  MainViewController.h
//  TaylorSwift
//
//  Created by Sue Brown on 12/12/09.
//  Copyright House of Crunchy 2009. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, 
												  UITableViewDelegate, 
												  UITableViewDataSource> {
	
	IBOutlet UITableView *songsTable;
	NSString *curTitle;
	NSArray *songListFearless;
	NSArray *songListTaylorSwift;
	
}

@property (nonatomic, retain) NSString *curTitle;
@property (nonatomic, retain) NSArray *songListFearless;
@property (nonatomic, retain) NSArray *songListTaylorSwift;

- (IBAction) showInfo;

@end
