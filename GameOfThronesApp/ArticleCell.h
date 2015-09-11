//
//  ArticleCell.h
//  GameOfThronesApp
//
//  Created by Macbook on 08.09.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *abstract;

@end
