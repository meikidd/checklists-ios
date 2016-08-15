//
//  DataModel.h
//  Checklists
//
//  Created by 梅晴光 on 16/8/15.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong) NSMutableArray *lists;
-(void)saveChecklists;

@end
