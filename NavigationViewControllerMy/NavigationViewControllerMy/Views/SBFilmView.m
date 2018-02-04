//
//  SBFilmView.m
//  NavigationViewControllerMy
//
//  Created by Artem Lomov on 04/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "SBFilmView.h"

@interface SBFilmView ()

@property (nonatomic, strong) UILabel *filmTitleLabel;
@property (nonatomic, strong) UIImageView *filmImageView;

@end

@implementation SBFilmView

- (instancetype)initWithFilm:(SBFilm *)film andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _filmTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 35)];
        _filmTitleLabel.text = film.filmTitle;
        [self addSubview:_filmTitleLabel];
         
        _filmImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_filmTitleLabel.frame), CGRectGetWidth(frame), CGRectGetWidth(frame)*1.5)];
        _filmImageView.image = film.filmImage;
        _filmImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_filmImageView];
    }
    return self;
}

@end
