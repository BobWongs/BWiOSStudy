//
//  BWHomeController.m
//  BWObjective-CStudy-iOS
//
//  Created by BobWong on 16/8/22.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import "BWHomeController.h"

#define kTitle @"kTitle"
#define kSegueId @"kSegueId"

#define kTitleRuntime @"Runtime"
#define kTitleKVO @"KVO"
#define kTitleKVC @"KVC"

#define kSegueIdPushToRuntime @"home_push_to_runtime"
#define kSegueIdPushToKVO @"home_push_to_kvo"
#define kSegueIdPushToKVC @"home_push_to_kvc"

@interface BWHomeController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BWHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Objective-C Study";
    
    NSDictionary *dict0 = @{
                            kTitle: kTitleRuntime,
                            kSegueId: kSegueIdPushToRuntime
                            };
    NSDictionary *dict1 = @{
                            kTitle: kTitleKVO,
                            kSegueId: kSegueIdPushToKVO
                            };
    NSDictionary *dict2 = @{
                            kTitle: kTitleKVC,
                            kSegueId: kSegueIdPushToKVC
                            };
    _dataSource = @[dict0, dict1, dict2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource ? _dataSource.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _dataSource[indexPath.row][kTitle];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSDictionary *dict = _dataSource[indexPath.row];
    [self performSegueWithIdentifier:dict[kSegueId] sender:dict];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *vc = segue.destinationViewController;
    NSDictionary *dict = (NSDictionary *)sender;
    vc.title = dict[kTitle];
}

@end
