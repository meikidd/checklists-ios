//
//  AllListsViewController.h
//  Checklists
//
//  Created by 梅晴光 on 16/8/5.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
#import "DataModel.h"

@interface AllListsViewController : UITableViewController<ListDetailViewControllerDelegate>

@property(nonatomic,strong)DataModel *dataModel;

@end;
