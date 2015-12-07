//
//  TableViewModel.m
//  NavigarionBarColorGradually
//
//  Created by JianRongCao on 15/12/7.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "TableViewModel.h"


@interface TableViewModel ()

@end

@implementation TableViewModel

- (id)init
{
    if (self = [super init]) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 75.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [_items[indexPath.row] valueForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)setItems:(NSMutableArray *)items
{
    if (![items isKindOfClass:[NSArray class]]) {
        return ;
    }
    [_items removeAllObjects];
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_items addObject:obj];
    }];
}

@end
