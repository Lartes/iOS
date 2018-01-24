//
//  MyTableViewCell.m
//  uitable
//
//  Created by Artem Lomov on 10/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "MyTableViewCell.h"

static const float INDENT = 15.;
static const float LABELSIZE = 20.;

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _myImageView = [[UIImageView alloc] init];
        _label1 = [[UILabel alloc] init];
        _label2 = [[UILabel alloc] init];
        _label3 = [[UILabel alloc] init];
        _label1.numberOfLines = 0;
        _label2.numberOfLines = 0;
        _label3.numberOfLines = 0;
        [self.contentView addSubview:_label1];
        [self.contentView addSubview:_label2];
        [self.contentView addSubview:_label3];
        [self.contentView addSubview:_myImageView];
        
        _myImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _label1.translatesAutoresizingMaskIntoConstraints = NO;
        _label2.translatesAutoresizingMaskIntoConstraints = NO;
        _label3.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

-(void)layoutSubviews
{
    self.myImageView.backgroundColor = [UIColor blackColor];
    self.label1.backgroundColor = [UIColor redColor];
    self.label2.backgroundColor = [UIColor greenColor];
    self.label3.backgroundColor = [UIColor blueColor];
    /*
    float imageSize = CGRectGetWidth(self.contentView.frame)/3.;
    self.myImageView.frame = CGRectMake(INDENT, INDENT/2., imageSize, imageSize);
    self.label1.frame = CGRectMake(CGRectGetMaxX(self.myImageView.frame) + INDENT, INDENT/2.,
                                   CGRectGetWidth(self.contentView.frame)-CGRectGetMaxX(self.myImageView.frame)-INDENT*2, LABELSIZE);
    self.label2.frame = CGRectMake(CGRectGetMaxX(self.myImageView.frame) + INDENT, CGRectGetMaxY(self.label1.frame)+INDENT,
                                   CGRectGetWidth(self.contentView.frame)-CGRectGetMaxX(self.myImageView.frame)-INDENT*2, LABELSIZE);
    self.label3.frame = CGRectMake(CGRectGetMaxX(self.myImageView.frame) + INDENT, CGRectGetMaxY(self.label2.frame)+INDENT,
                                   CGRectGetWidth(self.contentView.frame)-CGRectGetMaxX(self.myImageView.frame)-INDENT*2, LABELSIZE);
    self.label3.preferredMaxLayoutWidth = CGRectGetWidth(self.contentView.frame)-CGRectGetMaxX(self.myImageView.frame)-INDENT*2;
    [self.label3 sizeToFit];
    */
    
    [self.myImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:INDENT/2.];
    [self.myImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:INDENT/2.];
    [self.myImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:INDENT/2.];
    [self.myImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:INDENT/2.];
    
    /*
    [self.myImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:INDENT/2.];
    [self.label1.leadingAnchor constraintEqualToAnchor:self.myImageView.trailingAnchor constant:INDENT];
    [self.label2.leadingAnchor constraintEqualToAnchor:self.label1.leadingAnchor];
    [self.label3.leadingAnchor constraintEqualToAnchor:self.label1.leadingAnchor];
    [self.label1.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-INDENT/2.];
    [self.label2.trailingAnchor constraintEqualToAnchor:self.label1.trailingAnchor];
    [self.label3.trailingAnchor constraintEqualToAnchor:self.label1.trailingAnchor];
    
    [self.myImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:INDENT/2.];
    [self.label1.topAnchor constraintEqualToAnchor:self.myImageView.topAnchor];
    [self.myImageView.widthAnchor constraintEqualToAnchor:self.myImageView.heightAnchor multiplier:1.];
    [self.label2.topAnchor constraintEqualToAnchor:self.label1.bottomAnchor constant:INDENT];
    [self.label3.topAnchor constraintEqualToAnchor:self.label2.bottomAnchor constant:INDENT];
    [self.label3.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-INDENT/2.];
     */
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

