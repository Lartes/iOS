//
//  ProgressView.h
//  animation_blockanimation
//
//  Created by Artem Lomov on 31/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView
@property (nonatomic, strong) UIColor *progressColor;

- (void)setProgress:(CGFloat)progress withAnimation:(BOOL)animated;
@end
