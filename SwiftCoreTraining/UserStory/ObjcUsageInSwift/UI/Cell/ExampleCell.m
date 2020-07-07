//
//  ExampleCell.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import "ExampleCell.h"

@implementation ExampleCell

+ (NSString *) reuseIdentifier {
    return @"ExampleCellIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setupLayout];
    return self;
}

- (void) setupLayout{
    _avatarImage = [[UIImageView alloc] init];
    [self.contentView addSubview: _avatarImage];
    const CGFloat imageSize = (CGFloat)50.0;
    _avatarImage.layer.cornerRadius = imageSize / 2;
    _avatarImage.backgroundColor = UIColor.grayColor;
    _avatarImage.clipsToBounds = true;
    [_avatarImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
        make.size.equalTo(@(50));
    }];
    
    _userNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _userNameLabel];
    _userNameLabel.font = [UIFont systemFontOfSize:(25)];
    _userNameLabel.textColor = UIColor.blackColor;
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImage.mas_right).offset(10);
        make.right.equalTo(self.contentView);
        make.centerY.equalTo(self.avatarImage);
    }];
}

- (void) updateUI:(UserModel *) user {
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:user.avatarURL] placeholderImage:[UIImage imageNamed:@"avatarPlaceholder.png"]  options:SDWebImageRefreshCached];
   
    _userNameLabel.text = user.userName;
}

@end
