//
//  ChildView.m
//  TLApp
//
//  Created by TuanAnh on 9/27/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "ChildView.h"

@interface ChildView()
    @property (weak, nonatomic) IBOutlet UIImageView *imgV;
    @property (weak, nonatomic) IBOutlet UIButton *btnClose;
    
@end

@implementation ChildView
- (IBAction)btnCloseDidTap:(UIButton *)sender {
    
    [self removeFromSuperview];
}
    
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
