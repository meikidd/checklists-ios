//
//  ChecklistItem.m
//  Checklists
//
//  Created by 梅晴光 on 16/7/31.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

-(void)toggleChecked{
    self.checked = !self.checked;
}

@end
