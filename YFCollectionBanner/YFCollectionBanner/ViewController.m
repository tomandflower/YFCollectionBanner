//
//  ViewController.m
//  YFCollectionBanner
//
//  Created by tomandhua on 16/7/25.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (assign, nonatomic) NSInteger number;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    static NSString *ID=@"cell";
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor= [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0  blue:arc4random()%256/255.0  alpha:1.0];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 || indexPath.row == 2) {
        self.pageControl.currentPage = 1;
        self.number = indexPath.row;
    } else if (self.number < indexPath.row) {
        switch (indexPath.row) {
            case 0:
                self.pageControl.currentPage = 1;
                break;
                
            case 1:
                self.pageControl.currentPage = 2;
                break;
                
            default:
                break;
        }
        
        self.number = indexPath.row;
    } else if (self.number > indexPath.row) {
        switch (indexPath.row) {
            case 0:
                self.pageControl.currentPage = 1;
                break;
                
            case 1:
                self.pageControl.currentPage = 0;
                break;
                
            default:
                break;
        }
        
        self.number = indexPath.row;
    }
    NSLog(@"self.number = %ld", self.number);
    NSLog(@"indexPath.row = %ld",indexPath.row);
}



@end
