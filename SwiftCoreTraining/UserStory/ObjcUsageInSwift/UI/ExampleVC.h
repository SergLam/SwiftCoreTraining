//
//  ExampleViewController.h
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleView.h"
#import "../ViewModel/ExampleViewModel.h"
#import "Cell/ExampleCell.h"
#import "../DataModel/UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property ExampleView *contentView;
@property ExampleViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
