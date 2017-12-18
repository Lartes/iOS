//
//  SBCollectionViewCell.m
//  CollectionViewControllerTest
//
//  Created by Alexey Levanov on 18.12.17.
//  Copyright © 2017 Alexey Levanov. All rights reserved.
//

#import "SBCollectionViewCell.h"


@interface SBCollectionViewCell ()

@property (nonatomic, strong) UILabel *textLabel;

@end


@implementation SBCollectionViewCell


#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor blackColor];
        
        self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont boldSystemFontOfSize:14];
        self.textLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.textLabel];
    }
        
    return self;
}


#pragma mark - Overriden UICollectionViewCell methods

-(void)prepareForReuse
{
    [super prepareForReuse];
    
    self.text = @"";
}


#pragma mark - Overriden properties

-(void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = text;
}

@end
