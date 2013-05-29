//
//  CheckListViewCell.m
//  RealDaily
//
//  Created by bluemol on 5/29/13.
//  Copyright (c) 2013 Doradori. All rights reserved.
//

#import "CheckListViewCell.h"

@implementation CheckListViewCell

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
