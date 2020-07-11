//
//  Person.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 11.07.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype) initWithName: (NSString *) name birthday: (NSDate*) date {
    
    self = [super init];
    if (self) {
        self.birthday = date;
        self.name = name;
    }
    return self;
}

@end
