//
//  Checklist.h
//  Checklists
//
//  Created by 梅晴光 on 16/8/5.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>

-(int)countUncheckedItems;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *items;

@end
