//
//  UserModel.h
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property NSString* userName;
@property NSString* avatarURL;

 // Designated initializer
- (id)initWithName:(NSString*) userName withAvatar:(NSString*) avatarURL;

@end

NS_ASSUME_NONNULL_END
