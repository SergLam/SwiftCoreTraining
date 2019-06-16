//
//  ExampleViewController.m
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import "ExampleVC.h"

@interface ExampleVC ()

@end

@implementation ExampleVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [super init];
        _contentView = [[ExampleView alloc] init];
        _viewModel = [[ExampleViewModel alloc] init];
        return self;
    }
    return self;
}

- (void)loadView {
    self.view = _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray<UserModel*> * array = [self generateUsersArray];
    [_viewModel setUsersList:array];
    _contentView.tableView.dataSource = self;
    [_contentView.tableView reloadData];
}

- (NSMutableArray<UserModel*>*) generateUsersArray {
    NSMutableArray<UserModel*>* result = [NSMutableArray<UserModel*> array];
    for(int i=0; i < 100; i++) {
        NSString *userName = [NSString stringWithFormat:@"User %d", i];
        NSString *avatarURL = [NSString stringWithFormat:@"https://picsum.photos/300/300/?image=%d", i];
        UserModel* user = [[UserModel alloc] initWithName: userName withAvatar: avatarURL];
        [result addObject:user];
    }
    return result;
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ExampleCell *cell = [tableView dequeueReusableCellWithIdentifier: [ExampleCell reuseIdentifier]];
    [cell updateUI:self.viewModel.usersList[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog([NSString stringWithFormat:@"%d", _viewModel.usersList.count]);
    return _viewModel.usersList.count;
}

@end

#pragma mark - UITableViewDelegate
