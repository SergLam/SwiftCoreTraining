//
//  House.h
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 06.07.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface House : NSObject

@property (nonatomic, copy) NSString * address;
@property (nonatomic) NSInteger * numberOfBedrooms;
@property (nonatomic) BOOL hasHotTub;

@end

NS_ASSUME_NONNULL_END
