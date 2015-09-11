//
//  ArticleObject.m
//  GameOfThronesApp
//
//  Created by Macbook on 08.09.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "ArticleObject.h"

@implementation ArticleObject

-(instancetype)initWithTitle:(NSString*)title abstract:(NSString *)currentAbstract {
    
    if(!(self = [super init]))
        return nil;
    
    self.title = title;
    self.currentAbstract = currentAbstract;
    
    return self;
}

@end
