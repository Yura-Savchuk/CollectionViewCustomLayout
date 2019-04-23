//
//  ActivityCell.h
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 22.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ActivityCell : UICollectionViewCell

@property (nonatomic, strong) ActivityItem *item;

@end

NS_ASSUME_NONNULL_END
