//
//  ViewController.m
//  CollectionViewCustomLayout
//
//  Created by Yura Savchuk on 22.04.2019.
//  Copyright © 2019 Yura Savchuk. All rights reserved.
//

#import "ViewController.h"
#import "ActivityItem.h"
#import "ActivityCell.h"
#import "TimelineCollectionViewLayout.h"
#import "TimelineAtivityIndexPath.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, TimelineCollectionViewLayoutDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *items;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [self generateDummyItems];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ActivityCell" bundle:nil] forCellWithReuseIdentifier:@"ActivityCellIdentifier"];
    TimelineCollectionViewLayout *collectionViewLayout = [TimelineCollectionViewLayout new];
    collectionViewLayout.delegate = self;
    self.collectionView.collectionViewLayout = collectionViewLayout;
}

- (NSArray *)generateDummyItems
{
    
    return @[[self itemWithText:@"1" height:100],
             [self itemWithText:@"2" height:500],
             [self itemWithText:@"3" height:300],
             [self itemWithText:@"4" height:200],
             [self itemWithText:@"5" height:1000],
             [self itemWithText:@"6" height:400],
             [self itemWithText:@"7" height:100],
             [self itemWithText:@"8" height:500],
             [self itemWithText:@"9" height:300],
             [self itemWithText:@"10" height:200],
             [self itemWithText:@"11" height:1000],
             [self itemWithText:@"12" height:400],
             [self itemWithText:@"13" height:100],
             [self itemWithText:@"14" height:500],
             [self itemWithText:@"15" height:300],
             [self itemWithText:@"16" height:200],
             [self itemWithText:@"17" height:1000],
             [self itemWithText:@"18" height:400],
             [self itemWithText:@"19" height:100],
             [self itemWithText:@"20" height:500],
             [self itemWithText:@"21" height:300],
             [self itemWithText:@"22" height:200],
             [self itemWithText:@"23" height:1000],
             [self itemWithText:@"24" height:400],
             [self itemWithText:@"25" height:100],
             [self itemWithText:@"26" height:500],
             [self itemWithText:@"27" height:300],
             [self itemWithText:@"28" height:200],
             [self itemWithText:@"29" height:1000],
             [self itemWithText:@"30" height:400],
             [self itemWithText:@"31" height:100],
             [self itemWithText:@"32" height:500],
             [self itemWithText:@"33" height:300],
             [self itemWithText:@"34" height:200],
             [self itemWithText:@"35" height:1000],
             [self itemWithText:@"36" height:400]];
}

- (ActivityItem *)itemWithText:(NSString *)text height:(NSInteger )height
{
    ActivityItem *item = [ActivityItem new];
    item.text = text;
    item.height = height;
    return item;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(TimelineAtivityIndexPath *)indexPath
{
    ActivityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ActivityCellIdentifier" forIndexPath:indexPath];
    cell.item = self.items[indexPath.item];
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if ([kind isEqualToString:[PinCollectionView kind]])
//    {
//        return [collectionView dequeueReusableSupplementaryViewOfKind:[PinCollectionView kind] withReuseIdentifier:[PinCollectionView identifier] forIndexPath:indexPath];
//    }
//    return nil;
//}

#pragma mark - TimelineCollectionViewLayoutDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForTimelineActivityAtIndexPath:(NSIndexPath *)indexPath
{
    return @([self.items[indexPath.row] height]).doubleValue;
}

@end
