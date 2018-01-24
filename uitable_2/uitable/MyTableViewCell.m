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
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0., 0., 0., 0.)];
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., 0., 0.)];
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., 0., 0.)];
        _label3 = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., 0., 0.)];
        _label3.numberOfLines = 0;
        [self.contentView addSubview:_label1];
        [self.contentView addSubview:_label2];
        [self.contentView addSubview:_label3];
        [self.contentView addSubview:_myImageView];
    }
    return self;
}

- (void)layoutSubviews
{
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
    self.myImageView.backgroundColor = [UIColor blackColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

