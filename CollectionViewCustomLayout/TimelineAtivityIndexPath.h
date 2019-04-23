//
//  TimelineAtivityIndexPath.h
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 23.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ViewType)
{
    ViewTypeActivity,
    ViewTypePin
};

@interface TimelineAtivityIndexPath : NSIndexPath

@property (nonatomic, assign, readonly) ViewType viewType;

+ (instancetype)activityIndexPathWithItem:(NSInteger)item;
+ (instancetype)pinTypeIndexPath;

@end

NS_ASSUME_NONNULL_END
