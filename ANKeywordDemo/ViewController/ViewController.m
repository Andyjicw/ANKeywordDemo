//
//  ViewController.m
//  ANKeywordDemo
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 9/12/16.
//  Copyright © 2016 andy. All rights reserved.
//

#import "ViewController.h"
#import "ResultCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    // searchBar
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    self.searchBar.delegate        = self;
    self.searchBar.searchBarStyle  = UISearchBarStyleMinimal;
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone]; // 取消首字母大写
    [self.view addSubview:self.searchBar];
    
    // tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)
                                                  style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                           64,
                                                           self.view.frame.size.width - 20,
                                                           (self.view.frame.size.height - 64) / 2)];
    self.label.text = @"1234567890qwertyuiop[]\asdfghjkl;'zxcvbnm,./QWERTYUIOPASDFGHJKLZXCVBNM";
    self.label.textColor = [UIColor blackColor];
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return true;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"searchBarTextDidBeginEditing : %@", searchBar.text);
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    return true;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"searchBarTextDidEndEditing : %@", searchBar.text);
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"textDidChange : %@", searchText);
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0) {
    return true;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"searchBarSearchButtonClicked : %@", searchBar.text);
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED {
    NSLog(@"searchBarBookmarkButtonClicked : %@", searchBar.text);
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED {
    NSLog(@"searchBarCancelButtonClicked : %@", searchBar.text);
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED {
    NSLog(@"searchBarResultsListButtonClicked : %@", searchBar.text);
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0) {
    NSLog(@"selectedScopeButtonIndexDidChange");
}

@end
