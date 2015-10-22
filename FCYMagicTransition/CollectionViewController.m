//
//  CollectionViewController.m
//  FCYMagicTransition
//
//  Created by iFangcy on 15/7/13.
//  Copyright (c) 2015年 iFangcy. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "ShowDetailViewController.h"
#import "FCYMagicTransition.h"

@interface CollectionViewController () <UINavigationControllerDelegate>

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"CollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear: animated];
    
    self.navigationController.delegate = self;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if ([toVC isKindOfClass:[ShowDetailViewController class]]) {
        
        FCYMagicTransition *magicTransition = [[FCYMagicTransition alloc] init];
        return magicTransition;
    }else {
        return nil;
    }
}

@end
