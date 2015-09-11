//
//  ArticleDataSource.h
//  GameOfThronesApp
//
//  Created by Macbook on 10.09.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArticleDataSourceDelegate;

@interface ArticleDataSource : NSObject

@property (nonatomic,strong) NSMutableArray *objectHolderArray;
@property (nonatomic, weak) id<ArticleDataSourceDelegate> delegate;

- (void)loadDataSource;

@end

@protocol ArticleDataSourceDelegate <NSObject>

- (void)articleDataSourceReloadData;

@end
