//
//  SBFilmView.h
//  NavigationViewControllerMy
//
//  Created by Artem Lomov on 04/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBFilm.h"

@interface SBFilmView : UIView

- (instancetype)initWithFilm:(SBFilm *)film andFrame:(CGRect)frame;

@end
