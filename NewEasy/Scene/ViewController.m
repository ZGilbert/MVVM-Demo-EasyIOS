//
//  ViewController.m
//  NewEasy
//
//  Created by 朱潮 on 14-7-22.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "ViewController.h"
#import "GoodsCell.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[GoodsCell class] forCellWithReuseIdentifier:@"GoodsCell"];
    self.collectionView.SceneDelegate = self; //需要下拉刷新或者上拉加载需要设置代理
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView addHeader];   //添加下拉刷新
    [self.collectionView addFooter];   //添加上拉加载
    [self.collectionView initPage];
    
     //初始化sceneModel sceneModel扮演的就是MVVM中的ViewModel角色

    _demoSceneModel = [DemoSceneModel SceneModel];
    
    //demoSceneModel.goodsDisplay 有修改就自动进行页面刷新
    //demoSceneModel.goodsDisplay  的修改操作在_demoSceneModel中进行的
    [[RACObserve(self.demoSceneModel,goodsDisplay)
     filter:^BOOL(GoodsDisplay *newGoodsDisplay) {    //数据过滤
         return newGoodsDisplay !=nil;
     }]
     subscribeNext:^(GoodsDisplay *newGoodsDisplay) { //接收数据并刷新
         [_collectionView successWithNewArray:newGoodsDisplay.list];
         _collectionView.total = newGoodsDisplay.total;
         [_collectionView reloadData];
     }];
    
    @weakify(self);  //@weakify 在ReactiveCocoa中 避免self循环引用
    [RACObserve(self.demoSceneModel.goodsListRequest, state) //监控 网络请求的状态
     subscribeNext:^(NSNumber *state) {
         @strongify(self); //@strongify 在ReactiveCocoa中 防止提前释放

         if(self.demoSceneModel.goodsListRequest.failed){
             
           //  [MBProgressHUD showErrorWithStatus:@"数据加载失败!"];
         }else if(self.demoSceneModel.goodsListRequest.sending){
            // [MBProgressHUD showWithStatus:@"数据加载中!"];
         }else if(self.demoSceneModel.goodsListRequest.succeed){
            // [MBProgressHUD dismiss];
         }
     }];
    
    //数据绑定
    RAC(self.demoSceneModel.goodsListRequest,page) = RACObserve(self.collectionView,page);
    RAC(self.demoSceneModel.goodsListRequest,pageSize) = RACObserve(self.collectionView,pageSize);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate
-(void)handlePullLoader:(MJRefreshBaseView *)view state:(PullLoaderState)state{
        [super handlePullLoader:view state:state];
        if(state == HEADER_REFRESH){
            _collectionView.page = @1;
        }else if (state == REACH_BOTTOM){
            _collectionView.page = @([_collectionView.page integerValue] + 1);
        }
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionView.dataArray count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCell" forIndexPath:indexPath];
    GoodsCellDisplay *display =  [_collectionView.dataArray objectAtIndex:indexPath.row];
    [cell reload:display];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 230);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
