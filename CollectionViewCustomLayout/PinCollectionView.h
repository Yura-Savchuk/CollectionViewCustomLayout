//
//  PinCollectionView.h
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 23.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PinCollectionView : UICollectionReusableView

+ (NSString *)kind;
+ (NSString *)identifier;
+ (void)registerForCollectionViewLayout:(UICollectionViewLayout *)collectionViewLayout;

@end

NS_ASSUME_NONNULL_END
