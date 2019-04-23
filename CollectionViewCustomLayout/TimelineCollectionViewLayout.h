//
//  TimelineCollectionViewLayout.h
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 22.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TimelineCollectionViewLayoutDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForTimelineActivityAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface TimelineCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) id<TimelineCollectionViewLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
