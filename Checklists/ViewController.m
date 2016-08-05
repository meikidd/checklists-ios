//
//  ViewController.m
//  Checklists
//
//  Created by 梅晴光 on 16/7/31.
//  Copyright © 2016年 梅晴光. All rights reserved.
//

#import "ViewController.h"
#import "ChecklistItem.h"

@interface ViewController ()
- (IBAction)addItem:(id)sender;

@end

@implementation ViewController

NSMutableArray *_items;
ChecklistItem *_row0item;
ChecklistItem *_row1item;
ChecklistItem *_row2item;
ChecklistItem *_row3item;
ChecklistItem *_row4item;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _items = [[NSMutableArray alloc]initWithCapacity:20];
    ChecklistItem *item;
    item = [[ChecklistItem alloc]init];
    item.text =@"观看嫦娥 天和 兔升空的视频"; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init];
    item.text =@"了解Sony a7和MBP"; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init]; item.text =@"复习苍 师的经典视频教程"; item.checked = YES;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init]; item.text =@"去电影院看地 引 "; item.checked = NO;
    [_items addObject:item];
    item = [[ChecklistItem alloc]init]; item.text =@"看 甲巴萨新败的 赛回放"; item.checked = NO;
    [_items addObject:item];
}

-(void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    if(item.checked){
        label.text = @"√";
    }else{
        label.text = @"";
    }
}
-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [_items count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    ChecklistItem *item = _items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    ChecklistItem *item = _items[indexPath.row];
    [item toggleChecked];

    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)addItem:(id)sender {
    NSInteger newRowIndex = [_items count];
    ChecklistItem *item = [[ChecklistItem alloc]init];
    item.text = @"我是新来的菜鸟，求照顾求虐";
    item.checked = NO;
    [_items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [_items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item{
    NSInteger index = [_items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withChecklistItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"AddItem"]){
        
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController*) navigationController.topViewController;
        controller.delegate = self;
    }else if([segue.identifier isEqualToString:@"EditItem"]){
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController*) navigationController.topViewController;
        controller.delegate = self;
        NSIndexPath * indexPath = [self.tableView indexPathForCell:sender];
        controller.itemToEdit = _items[indexPath.row];
    }
}
@end
