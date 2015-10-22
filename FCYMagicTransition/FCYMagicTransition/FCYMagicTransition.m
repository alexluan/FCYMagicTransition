//
//  FCYMagicTransition.m
//  FCYMagicTransition
//
//  Created by iFangcy on 15/7/14.
//  Copyright (c) 2015年 iFangcy. All rights reserved.
//

#import "FCYMagicTransition.h"
#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "ShowDetailViewController.h"

@implementation FCYMagicTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.6f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    CollectionViewController *fromVC = (CollectionViewController *)[transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey];
    ShowDetailViewController *toVC = (ShowDetailViewController *)[transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    // 对cell上的图片进行截图，并将这个图片本身隐藏起来
    CollectionViewCell *cell = (CollectionViewCell *) [fromVC.collectionView cellForItemAtIndexPath: [[fromVC.collectionView indexPathsForSelectedItems] firstObject]];
    fromVC.indexPath = [[fromVC.collectionView indexPathsForSelectedItems] firstObject];
    
    UIView *snapShotView = [cell.imageView snapshotViewAfterScreenUpdates: NO];
    snapShotView.frame = fromVC.finalCellRect = [containerView convertRect: cell.imageView.frame fromView: cell.imageView.superview];
    cell.imageView.hidden = YES;
    
    // 设置第二个控制器的位置、透明度
    toVC.view.frame = [transitionContext finalFrameForViewController: toVC];
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    
    // 把动画前后的2个控制器加到容器中，注意顺序
    [containerView addSubview: toVC.view];
    [containerView addSubview: snapShotView];
    
    // 动画，让第二个控制器透明度0 ～ 1，让截图 snapShowView 位置更新
    [UIView animateWithDuration: [self transitionDuration: transitionContext] delay: 0.0f usingSpringWithDamping: 0.5 initialSpringVelocity: 0 options: UIViewAnimationOptionCurveLinear animations:^{
        
        toVC.view.alpha = 1.0;
        snapShotView.frame = [containerView convertRect: toVC.imageView.frame fromView: toVC.view];
        
    } completion:^(BOOL finished) {
        
        toVC.imageView.hidden = NO;
        cell.imageView.hidden = NO;
        [snapShotView removeFromSuperview];
        
        [transitionContext completeTransition: !transitionContext.transitionWasCancelled];
        
    }];
    
    
}

























@end
