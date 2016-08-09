//
//  ItemDetailViewController.h
//  Checklists
//
//  Created by 梅晴光 on 16/8/4.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController*)controller;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishAddingItem:(ChecklistItem*)item;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishEditingItem:(ChecklistItem*)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property(nonatomic,strong) ChecklistItem *itemToEdit;
@property(nonatomic,weak) id <ItemDetailViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
