//
//  MemoViewCell.m
//  RealDaily
//
//  Created by Joey Liang on 5/26/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "MemoViewCell.h"

@implementation MemoViewCell

@synthesize bgImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
