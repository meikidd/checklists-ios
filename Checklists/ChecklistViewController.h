//
//  ChecklistViewController.h
//  Checklists
//
//  Created by 梅晴光 on 16/7/31.
//  Copyright © 2016年 梅晴光. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property(nonatomic, strong) Checklist *checklist;

@end
