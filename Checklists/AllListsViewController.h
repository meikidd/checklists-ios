//
//  AllListsViewController.h
//  Checklists
//
//  Created by 梅晴光 on 16/8/5.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@interface AllListsViewController : UITableViewController<ListDetailViewControllerDelegate>
-(void)saveChecklists;
@end;
