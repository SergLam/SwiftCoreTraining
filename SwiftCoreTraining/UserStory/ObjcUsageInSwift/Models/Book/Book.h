//
//  Book.h
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 11.07.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Person/Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, strong) Person* author;
@property (nonatomic, strong) NSDate* publicationDate;

@end

NS_ASSUME_NONNULL_END
