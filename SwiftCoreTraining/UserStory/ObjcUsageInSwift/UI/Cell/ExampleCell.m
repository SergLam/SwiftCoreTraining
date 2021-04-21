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
    
    _avatarImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [_avatarImage.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant: 10.0],
       [_avatarImage.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -10.0],
       [_avatarImage.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant: 10.0],
       [_avatarImage.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant: -10.0]
    ]];
    
    _userNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview: _userNameLabel];
    _userNameLabel.font = [UIFont systemFontOfSize:(25)];
    _userNameLabel.textColor = UIColor.blackColor;
    
    [NSLayoutConstraint activateConstraints:@[
        [_userNameLabel.leadingAnchor constraintEqualToAnchor:self.avatarImage.trailingAnchor constant: 10.0],
       [_userNameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -10.0],
       [_userNameLabel.centerYAnchor constraintEqualToAnchor:self.avatarImage.centerYAnchor],
    ]];
    
}

- (void) updateUI:(UserModel *) user {
    
    [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:user.avatarURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        __weak __typeof__(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            __typeof__(self) strongSelf = weakSelf;
            strongSelf.avatarImage.image = [UIImage imageWithData:data];
        });
        
    }];
    
    _userNameLabel.text = user.userName;
}

@end
