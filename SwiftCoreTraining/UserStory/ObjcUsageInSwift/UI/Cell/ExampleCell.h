//
//  ExampleCell.h
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../DataModel/UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleCell : UITableViewCell

- (void) updateUI:(UserModel*) user;

+ (NSString*) reuseIdentifier;

@property (strong, nonatomic) UIImageView * avatarImage;
@property (strong, nonatomic) UILabel * userNameLabel;

@end

NS_ASSUME_NONNULL_END
