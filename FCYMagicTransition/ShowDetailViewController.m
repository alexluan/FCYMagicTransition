//
//  ShowDetailViewController.m
//  FCYMagicTransition
//
//  Created by iFangcy on 15/7/13.
//  Copyright (c) 2015年 iFangcy. All rights reserved.
//

#import "ShowDetailViewController.h"
#import "FCYMagicInverseTransition.h"

@interface ShowDetailViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenTransition;

@end

@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget: self action: @selector(edgePanGesture:)];
    edgePanGesture.edges = UIRectEdgeLeft;
    
    [self.view addGestureRecognizer: edgePanGesture];
}

- (void) edgePanGesture: (UIScreenEdgePanGestureRecognizer *) gesture {
    
    CGFloat progress = [gesture translationInView: self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
}

@end
