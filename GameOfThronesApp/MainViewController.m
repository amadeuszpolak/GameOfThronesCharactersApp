//
//  MainViewController.m
//  GameOfThronesApp
//
//  Created by Macbook on 08.09.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "MainViewController.h"

#import "ArticleObject.h"
#import "ArticleCell.h"
#import "ArticleDataSource.h"

@interface MainViewController () <ArticleDataSourceDelegate>

@property (nonatomic, weak) IBOutlet ArticleDataSource *articleDataSource;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.articleDataSource.delegate = self;
}

- (IBAction)fetchData:(id)sender {
    
    [self.articleDataSource loadDataSource];
}

#pragma mark - ArticleDataSourceDelegate

- (void)articleDataSourceReloadData {
    
    [self.tableView reloadData];
}

@end
