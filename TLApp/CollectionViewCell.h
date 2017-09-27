//
//  CollectionViewCell.h
//  TLApp
//
//  Created by TuanAnh on 9/27/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionViewCell;
@protocol CollectionViewCellDelegate
-(void)cellDidLongTap:(CollectionViewCell*)cell;
@end

@interface CollectionViewCell : UICollectionViewCell
    @property (nonatomic , strong) id <CollectionViewCellDelegate> delegate;
@end
