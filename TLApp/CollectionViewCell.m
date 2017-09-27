//
//  CollectionViewCell.m
//  TLApp
//
//  Created by TuanAnh on 9/27/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 10.0f;
    UILongPressGestureRecognizer *logTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongTap)];
    [self addGestureRecognizer:logTap];
    
    // Initialization code
}
    

    -(void)handleLongTap{
        
        NSLog(@"log tap");
        [_delegate cellDidLongTap:self];
        
    }

@end
