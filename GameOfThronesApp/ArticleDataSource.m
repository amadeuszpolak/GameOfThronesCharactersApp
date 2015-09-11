//
//  ArticleDataSource.m
//  GameOfThronesApp
//
//  Created by Macbook on 10.09.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

//#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

#import "ArticleDataSource.h"
#import "ArticleObject.h"
#import "ArticleCell.h"

#define JSON_URL @"http://gameofthrones.wikia.com/api/v1/Articles/Top?expand=1&category=Characters&limit=75"

@implementation ArticleDataSource

- (void)loadDataSource {
    
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0ul);
        dispatch_async(queue, ^{
            
        if (![self connected]) {
            NSLog(@"No Internet Connection");
        }
        else {
            NSURL *URL = [NSURL URLWithString:JSON_URL];
            NSData *jsonData = [NSData dataWithContentsOfURL:URL];
            NSError *error = nil;
            
            NSDictionary *dataDictionary = [NSJSONSerialization
                                            JSONObjectWithData:jsonData options:0 error:&error];
            NSDictionary *itemsDictionary = dataDictionary[@"items"];
            
            for (NSDictionary *dictionary in itemsDictionary) {
                ArticleObject *currenArticle = [[ArticleObject alloc] initWithTitle:[dictionary objectForKey:@"title"] abstract:[dictionary objectForKey:@"abstract"]];
                [self.objectHolderArray addObject:currenArticle];
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                [self.delegate articleDataSourceReloadData];
            });
        }
    });
}

#pragma mark tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.objectHolderArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ArticleCell *cell = (ArticleCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ArticleCell class])];
    
    if (cell == nil) {
        cell = [[ArticleCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:NSStringFromClass([ArticleCell class])];
    }
    
    ArticleObject *currentArticle = [self.objectHolderArray objectAtIndex:indexPath.row];
    
    cell.title.text = currentArticle.title;
    cell.title.numberOfLines = 1;
    cell.title.adjustsFontSizeToFitWidth = YES;
    
    cell.abstract.text = currentArticle.currentAbstract;
    cell.abstract.numberOfLines = 2;
    
    return cell;
}

#pragma Setters/Getters

- (NSMutableArray *)objectHolderArray {
    
    if(!_objectHolderArray) _objectHolderArray = [[NSMutableArray alloc]init];
    
    return _objectHolderArray;
}

#pragma internet connection check

- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    if (networkStatus == NotReachable) return NO;
    else return YES;
}

@end
