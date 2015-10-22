//
//  FCYMagicInverseTransition.m
//  FCYMagicTransition
//
//  Created by iFangcy on 15/7/14.
//  Copyright (c) 2015年 iFangcy. All rights reserved.
//

#import "FCYMagicInverseTransition.h"
#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "ShowDetailViewController.h"

@implementation FCYMagicInverseTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    CollectionViewController *toVC = (CollectionViewController *)[transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];
    ShowDetailViewController *fromVC = (ShowDetailViewController *)[transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 在前一个控制器上创建一个截图
    UIView *snapShotView = [fromVC.imageView snapshotViewAfterScreenUpdates: NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    snapShotView.frame = [containerView convertRect: fromVC.imageView.frame fromView: fromVC.view];
    fromVC.imageView.hidden = YES;
    
    // 初始化后一个控制器位置
    toVC.view.frame = [transitionContext finalFrameForViewController: toVC];
    
    // 获取目标控制器中图片位置
    CollectionViewCell *cell = (CollectionViewCell *) [toVC.collectionView cellForItemAtIndexPath: toVC.indexPath];
    cell.imageView.hidden = YES;
    
    //
    [containerView insertSubview: toVC.view aboveSubview: fromVC.view];
    [containerView addSubview: snapShotView];
    
    [UIView animateWithDuration: [self transitionDuration: transitionContext] delay: 0.0f usingSpringWithDamping: 0.5f initialSpringVelocity: 1.0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
        
        fromVC.view.alpha = 0.0f;
        snapShotView.frame = toVC.finalCellRect;
        
        
    } completion:^(BOOL finished) {
        
        [snapShotView removeFromSuperview];
        fromVC.imageView.hidden = NO;
        cell.imageView.hidden = NO;
        [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];
        
    }];
    
    
}





























@end
