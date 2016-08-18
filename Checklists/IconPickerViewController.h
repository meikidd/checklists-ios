//
//  IconPickerViewController.h
//  Checklists
//
//  Created by 梅晴光 on 16/8/16.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>
-(void)iconPicker:(IconPickerViewController*)picker didPickIcon:(NSString*)iconName;
@end

@interface IconPickerViewController : UITableViewController
@property(nonatomic,weak)id <IconPickerViewControllerDelegate> delegate;
@end
