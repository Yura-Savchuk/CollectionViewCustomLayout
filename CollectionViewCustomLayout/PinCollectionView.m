//
//  PinCollectionView.m
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 23.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import "PinCollectionView.h"

@implementation PinCollectionView

+ (NSString *)kind
{
    return @"Pin";
}

+ (NSString *)identifier
{
    return @"PinIdentifier";
}

+ (void)registerForCollectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
{
    [collectionViewLayout registerNib:[UINib nibWithNibName:@"PinCollectionView" bundle:nil] forDecorationViewOfKind:[self kind]];
}

@end
