//
//  AutoCellHeightViewController.m
//  AutoLayout
//
//  Created by yanliu on 14/04/2017.
//  Copyright © 2017 huawei. All rights reserved.
//

#import "AutoCellHeightViewController.h"
#import "IncreaseLabelCell.h"
#import "ConstraintUpdateCell.h"
#import "ConstraintUpdateCellModel.h"
@interface AutoCellHeightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *cellModels;
@end

@implementation AutoCellHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *models = [[NSMutableArray alloc] init];
    for (int i=0; i<5; i++) {
        ConstraintUpdateCellModel *model = [[ConstraintUpdateCellModel alloc] init];
        model.isExpended = YES;
        [models addObject:model];
    }
    _cellModels = models;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerClass:[IncreaseLabelCell class] forCellReuseIdentifier:NSStringFromClass([IncreaseLabelCell class])];
    [self.tableView registerClass:[ConstraintUpdateCell class] forCellReuseIdentifier:NSStringFromClass([ConstraintUpdateCell class])];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview datasouce
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2 == 0) {
        IncreaseLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([IncreaseLabelCell class])];
        cell.increaseLabel.text = @"This may not seem very useful at first. In fact, why not just increase the content size? Well, you should avoid changing the content size of a scroll view unless you have to. To understand why, consider a table view (UITableView is a subclass of UIScrollView, so it has all of the same properties). The table view’s scrollable area has been carefully calculated to fit each one of its cells snugly. When you scroll past the boundaries of the table view’s first or last cells, the table view snaps the content ";
        cell.handleIncrease = ^() {
            [self.tableView beginUpdates];
            [self.tableView endUpdates];
        };
        return cell;
    }else{
        ConstraintUpdateCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ConstraintUpdateCell class]) forIndexPath:indexPath];
        ConstraintUpdateCellModel *model = _cellModels[indexPath.row/2];
        __weak typeof(self) weakSelf = self;
        cell.handleChange = ^{
            model.isExpended = !model.isExpended;
            [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//            [weakSelf.tableView beginUpdates];
//            [weakSelf.tableView endUpdates];
//            [weakSelf.tableView reloadData];
        };
        cell.isExpanded = model.isExpended;
        [cell setupSubViews];
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellModels.count*2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
