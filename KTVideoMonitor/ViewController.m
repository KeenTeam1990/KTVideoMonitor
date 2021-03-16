//
//  ViewController.m
//  KTVideoMonitor
//
//  Created by keenteam on 2018/4/25.
//  Copyright © 2018年 keenteam. All rights reserved.
//

#import "ViewController.h"
#import "YXHomeAdvertisementModel.h"
#import "VideoDetailViewController.h"
#import "TKHomeNew_serviceViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)NSMutableArray*  quickEntryArr5;
@property (nonatomic, strong) UICollectionView *classMenuCollection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.classMenuCollection];
    
    
    
}
#pragma mark - collectionView DataSource Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.quickEntryArr5.count;
}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //调用代理
    YXHomeAdvertisementModel * model = self.quickEntryArr5[indexPath.row];
    VideoDetailViewController * bananerInfoVC = [[VideoDetailViewController alloc]init];
    UINavigationController * nvc = [[UINavigationController alloc]initWithRootViewController:bananerInfoVC];
    bananerInfoVC.vedioUrl = model.advertisementLink;
    bananerInfoVC.titleName = model.advertisementNm;
    nvc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nvc animated:NO completion:nil];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TKHomeNew_serviceViewCell *cell = (TKHomeNew_serviceViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:TKHomeNew_serviceViewCellIndentify forIndexPath:indexPath];
    cell.model = self.quickEntryArr5[indexPath.item];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

#pragma mark --- 懒加载
- (UICollectionView *)classMenuCollection{
    if (!_classMenuCollection)
    {
        UICollectionViewFlowLayout *floatLaytou = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat itemWidth = (self.view.frame.size.width-20)*0.5;
        floatLaytou.itemSize = CGSizeMake(itemWidth, 150.0f);
        // 列间距
        floatLaytou.minimumInteritemSpacing = 5;
        floatLaytou.minimumLineSpacing = 5;
        floatLaytou.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动范围，水平滚动视图
        _classMenuCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width-10,self.view.frame.size.height) collectionViewLayout:floatLaytou];
        _classMenuCollection.backgroundColor = [UIColor colorWithRed:243 green:243 blue:243 alpha:1.0f];
        [_classMenuCollection registerClass:[TKHomeNew_serviceViewCell class] forCellWithReuseIdentifier:TKHomeNew_serviceViewCellIndentify];
        _classMenuCollection.delegate = self;
        _classMenuCollection.showsVerticalScrollIndicator = NO;
        
        _classMenuCollection.dataSource = self;
        _classMenuCollection.bounces = YES;
        _classMenuCollection.scrollEnabled = YES;
        _classMenuCollection.scrollsToTop = NO;
    }
    return _classMenuCollection;
}

#pragma mark --------------- 懒加载 quickEntryArr4 -----------------
-(NSMutableArray *)quickEntryArr5{
       NSArray * titleArr = @[@"美国卫视1直播",@"美国卫视2直播",@"韩国卫视直播",@"湖南卫视直播",@"湖南卫视直播",@"湖南卫视直播",@"湖南卫视直播",@"湖南卫视直播",@"湖南卫视直播",@"湖南卫视直播"];
    NSArray * urlArr = @[@"rtmp://ns8.indexforce.com/home/mystream"
                         ,@"rtmp://media3.scctv.net/live/scctv_800"
                         ,@"rtmp://mobliestream.c3tv.com:554/live/goodtv.sdp"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"
                         ,@"rtmp://58.200.131.2:1935/livetv/hunantv"];
    if (!_quickEntryArr5 ) {
        _quickEntryArr5 = [[NSMutableArray alloc]init];
        
        for (int i =0; i<=9; i++) {
            
            YXHomeAdvertisementModel * model = [[YXHomeAdvertisementModel alloc]init];
            model.advertisementNm = [NSString stringWithFormat:@"%@",titleArr[i]];
            model.advertisementImg = @"bao_zhuang";
            model.advertisementLink = [NSString stringWithFormat:@"%@",urlArr[i]];
            [_quickEntryArr5 addObject:model];
        }
    }
    
    return _quickEntryArr5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

