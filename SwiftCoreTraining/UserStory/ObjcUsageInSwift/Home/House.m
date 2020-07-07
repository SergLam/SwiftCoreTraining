//
//  House.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 06.07.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

#import "House.h"

@implementation House

- (instancetype) initWithAddress: (NSString * )address bedroomsCount:(NSInteger *)count hasHotTub:(BOOL)tub {
    
    self = [super init];
    if (self) {
        self.address = address;
        self.numberOfBedrooms = count;
        self.hasHotTub = tub;
    }
    return self;
}

@end
