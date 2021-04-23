//
//  ExampleView.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import "ExampleView.h"
#import "ExampleCell.h"

@implementation ExampleView : UIView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    }
    [self setupLayout];
    return self;
}

- (void) setupLayout {
    
    [self addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [_tableView.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor],
       [_tableView.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor],
       [_tableView.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor],
       [_tableView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor]
    ]];
    
    [_tableView registerClass:ExampleCell.class forCellReuseIdentifier: [ExampleCell reuseIdentifier]];
}

@end

