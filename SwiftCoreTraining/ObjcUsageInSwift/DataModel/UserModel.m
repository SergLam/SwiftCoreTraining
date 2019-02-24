//
//  UserModel.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (id)initWithName:(NSString*) userName withAvatar:(NSString*) avatarURL
{
    self = [super init];
    if (self) {
        _avatarURL = avatarURL;
        _userName = userName;
    }
    return self;
}

@end
