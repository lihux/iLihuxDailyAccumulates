//
//  OA05GCDViewController.m
//  iLihuxDailyAccumulatesInOC
//
//  Created by lihux on 15/1/8.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

#import "OA05GCDViewController.h"

#import "OA05CustomCurrentOperation.h"

@interface OA05GCDViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *indexButton;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *indexContainerView;

@property (nonatomic, strong) NSArray *chapters;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *indexViewTopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *indexViewTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *indexViewBottomConstraint;
@property (nonatomic, assign) CGFloat indexViewBottomConstraintConstant;
@property (nonatomic, strong) UIColor* indexButtonOriginColor;

@end

@implementation OA05GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadChaptersFromPlistFile];
    [self.tableview reloadData];
    self.indexViewBottomConstraintConstant = self.indexViewBottomConstraint.constant;
    self.indexButtonOriginColor = self.indexButton.backgroundColor;
}

- (void)loadChaptersFromPlistFile
{
    self.chapters = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OA05GCD" ofType:@"plist"]];
}

- (IBAction)didTapOnIndexButton:(id)sender
{
    if (self.indexButton.tag == 1) {
        self.indexButton.tag = 0;
        [self animatedShowIndexView];
    } else {
        self.indexButton.tag = 1;
        [self animatedHideIndexView];
    }
}

- (void)animatedShowIndexView
{
    [self.indexContainerView.superview addConstraint:self.indexViewTopConstraint];
    [self.indexContainerView.superview addConstraint:self.indexViewTrailingConstraint];
    self.indexViewBottomConstraint.constant = self.indexViewBottomConstraintConstant;
    self.indexButton.enabled = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.indexButton.backgroundColor = self.indexButtonOriginColor;
        self.indexContainerView.layer.cornerRadius = 4;
        self.tableview.alpha = 1;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.indexButton.enabled = YES;
    }];
}

- (void)animatedHideIndexView
{
    [self.indexContainerView.superview removeConstraint:self.indexViewTopConstraint];
    [self.indexContainerView.superview removeConstraint:self.indexViewTrailingConstraint];
    self.indexViewBottomConstraint.constant = - self.indexButton.bounds.size.height;
    self.indexButton.enabled = NO;
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.2 animations:^{
        self.indexButton.backgroundColor = [UIColor clearColor];
        self.indexContainerView.layer.cornerRadius = 22;
        self.tableview.alpha = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.indexButton.enabled = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chapters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.chapters[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self didTapOnIndexButton:self.indexButton];
    [self.tableview deselectRowAtIndexPath:indexPath animated:true];
}

@end
