//
//  ExampleViewModel.h
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../DataModel/UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleViewModel : NSObject

@property (nonatomic, readonly) NSMutableArray<UserModel*> *usersList;

- (instancetype)init;

- (void) setUsersList: (NSMutableArray<UserModel*>*) users;

@end

NS_ASSUME_NONNULL_END
