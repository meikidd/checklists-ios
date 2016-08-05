//
//  ChecklistItem.h
//  Checklists
//
//  Created by 梅晴光 on 16/7/31.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;
-(void)toggleChecked;

@end
