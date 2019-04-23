//
//  ActivityCell.m
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 22.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import "ActivityCell.h"

@interface ActivityCell()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ActivityCell

- (void)setItem:(ActivityItem *)item
{
    _item = item;
    [self updateViewWithItem];
}

- (void)updateViewWithItem
{
    self.label.text = self.item.text;
}

@end
