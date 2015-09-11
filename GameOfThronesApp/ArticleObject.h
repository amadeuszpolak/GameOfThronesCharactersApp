//
//  ArticleObject.h
//  GameOfThronesApp
//
//  Created by Macbook on 08.09.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleObject : NSObject

-(instancetype)initWithTitle:(NSString*)title abstract:(NSString *)currentAbstract;

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *currentAbstract;

@end
