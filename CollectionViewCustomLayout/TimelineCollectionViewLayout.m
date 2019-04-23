//
//  TimelineCollectionViewLayout.m
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 22.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import "TimelineCollectionViewLayout.h"
#import "TimelineAtivityIndexPath.h"
#import "PinCollectionView.h"

#define kLeftColumnIndex           0
#define kRightColumnIndex          1
#define kNumberOfColumns           2
#define kTimelineWidth             40
#define kContentPadding            5
#define kActivitiesSection         0
#define kMinActivityHeight         100
#define kPinYOffset                30
#define kPinHeight                 2
#define kPinWidth                  40
#define kPinOverActivityWidth      10
#define kOppositeColumnPinOffset   20

@interface TimelineCollectionViewLayout ()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *cashedLayoutAttributes;

@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat contentWidth;

@end

@implementation TimelineCollectionViewLayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [PinCollectionView registerForCollectionViewLayout:self];
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.cashedLayoutAttributes = [NSMutableArray new];
    
    UIEdgeInsets contentInset = self.collectionView.contentInset;
    self.contentWidth = CGRectGetWidth(self.collectionView.bounds) - contentInset.left - contentInset.right;
    
    CGFloat leftColumnXOffset = 0;
    CGFloat activitiesColumnWidth = (self.contentWidth - kTimelineWidth - 2*kContentPadding) / 2;
    CGFloat rightColumnXOffset = activitiesColumnWidth + kTimelineWidth + 2*kContentPadding;
    
    NSMutableArray<NSNumber *> *xOffset = [@[@(leftColumnXOffset), @(rightColumnXOffset)] mutableCopy];
    NSMutableArray<NSNumber *> *yOffset = [@[@(0), @(0)] mutableCopy];
    
    NSInteger column = kLeftColumnIndex;
    
    for (NSInteger i=0; i<[self.collectionView numberOfItemsInSection:kActivitiesSection]; i++)
    {
        NSIndexPath *activityIndexPath = [TimelineAtivityIndexPath activityIndexPathWithItem:i];
        
        CGFloat activityHeight = [self.delegate collectionView:self.collectionView heightForTimelineActivityAtIndexPath:activityIndexPath];
        CGFloat height = kContentPadding * 2 + MAX(activityHeight, kMinActivityHeight);
        CGRect frame = CGRectMake(xOffset[column].doubleValue, yOffset[column].doubleValue, activitiesColumnWidth, height);
        CGRect insetFrame = CGRectInset(frame, kContentPadding, kContentPadding);
        
        UICollectionViewLayoutAttributes *activityAttrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:activityIndexPath];
        activityAttrs.frame = insetFrame;
        [self.cashedLayoutAttributes addObject:activityAttrs];
        
        //pin
        CGFloat pinYPos = insetFrame.origin.y + kPinYOffset;
        CGFloat pinXPos;
        if (column == kRightColumnIndex)
        {
            pinXPos = insetFrame.origin.x - kPinWidth + kPinOverActivityWidth;
        }
        else
        {
            pinXPos = CGRectGetMaxX(insetFrame) - kPinOverActivityWidth;
        }
        UICollectionViewLayoutAttributes *pinAttrs = [self layoutAttributesForDecorationViewOfKind:[PinCollectionView kind] atIndexPath:activityIndexPath];
        pinAttrs.frame = CGRectMake(pinXPos, pinYPos, kPinWidth, kPinHeight);
        [self.cashedLayoutAttributes addObject:pinAttrs];
        
        self.contentHeight = MAX(self.contentHeight, CGRectGetMaxY(frame));
        yOffset[column] = @(yOffset[column].doubleValue + height);
        
        NSInteger oppositeColumn = [self oppositeColumnIndexFromIndex:column];
        
        yOffset[oppositeColumn] = @(MAX(yOffset[oppositeColumn].doubleValue, pinYPos + kOppositeColumnPinOffset));
        
        column = oppositeColumn;
    }
}

- (NSInteger)oppositeColumnIndexFromIndex:(NSInteger)columnIndex
{
    if (columnIndex == kLeftColumnIndex)
    {
        return kRightColumnIndex;
    }
    return kLeftColumnIndex;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *attrs = [self.cashedLayoutAttributes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *attributes, NSDictionary<NSString *,id> * _) {
        return CGRectIntersectsRect(attributes.frame, rect);
    }]];
    
    return attrs;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cashedLayoutAttributes[indexPath.row];
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.contentWidth, self.contentHeight);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    if ([elementKind isEqualToString:[PinCollectionView kind]])
    {
        attrs.frame = CGRectMake(30, 50 * indexPath.item, 100, 2);
    }
    return attrs;
}

@end
