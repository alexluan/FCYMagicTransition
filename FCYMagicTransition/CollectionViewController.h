//
//  CollectionViewController.h
//  FCYMagicTransition
//
//  Created by iFangcy on 15/7/13.
//  Copyright (c) 2015年 iFangcy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionViewCell;

@interface CollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) CGRect finalCellRect;

@end
