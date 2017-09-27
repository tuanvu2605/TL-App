//
//  AppViewController.m
//  TLApp
//
//  Created by TuanAnh on 9/27/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "AppViewController.h"
#import "KRLCollectionViewGridLayout.h"
#import "CollectionViewCell.h"
#import "UIView+draggable.h"
#import "ChildView.h"

@interface AppViewController ()<UICollectionViewDelegate , UICollectionViewDataSource,UIGestureRecognizerDelegate,CollectionViewCellDelegate>
    @property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
    @property (weak, nonatomic) IBOutlet UICollectionView *collection;
    @property (weak, nonatomic) IBOutlet UIView *mainView;
    
    
@end

static NSString *cellID = @"cellId";

@implementation AppViewController
{
    KRLCollectionViewGridLayout *_layout;
}
    


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLayout];
 
    // Do any additional setup after loading the view.
}
    
-(void)configureLayout
{
    [_collection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    _layout = [[KRLCollectionViewGridLayout alloc]init];
    _layout.numberOfItemsPerLine = 1;
    _layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    _layout.interitemSpacing = 20;
    _layout.lineSpacing = 10;
    _layout.aspectRatio = 1;
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collection.collectionViewLayout = _layout;
    _collection.delegate = self;
    _collection.dataSource = self;
    
    
}
    
    

- (IBAction)segmentDidTap:(UISegmentedControl *)sender {
    
    
}
    

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.delegate = self;
    
    return cell;
}
    
    -(void)cellDidLongTap:(CollectionViewCell *)cell
    {
        NSIndexPath *idp = [_collection indexPathForCell:cell];
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ChildView" owner:nil options:nil];
        
        ChildView *v = nib.firstObject;
        [v setFrame:CGRectMake(0, 0, 80, 80)];
        v.backgroundColor = [UIColor clearColor];
        v.center = self.mainView.center;
        [v enableDragging];
        [v setCagingArea:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [self.mainView addSubview:v];
        [self.mainView bringSubviewToFront:v];
        
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
