//
//  ExampleView.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import "ExampleView.h"
#import "ExampleCell.h"
#import "Masonry.h"

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
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(self.safeAreaInsets);
    }];
    [_tableView registerClass:ExampleCell.class forCellReuseIdentifier: [ExampleCell reuseIdentifier]];
}

@end

