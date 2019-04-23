//
//  TimelineAtivityIndexPath.m
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 23.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import "TimelineAtivityIndexPath.h"

@interface TimelineAtivityIndexPath ()

@property (nonatomic, assign, readwrite) ViewType viewType;

@end

@implementation TimelineAtivityIndexPath

+ (instancetype)activityIndexPathWithItem:(NSInteger)item
{
    TimelineAtivityIndexPath *indexPath = [TimelineAtivityIndexPath indexPathForItem:item inSection:0];
    indexPath.viewType = ViewTypeActivity;
    return indexPath;
}

+ (instancetype)pinTypeIndexPath
{
    TimelineAtivityIndexPath *indexPath = [TimelineAtivityIndexPath indexPathForItem:0 inSection:0];
    indexPath.viewType = ViewTypePin;
    return indexPath;
}

@end
