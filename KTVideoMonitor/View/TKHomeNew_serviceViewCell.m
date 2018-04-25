//
//  TKHomeNew_serviceViewCell.m
//  EasySchool
//

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖保佑             永无BUG
//---------------------------------------------------------------------------*/
//
//  Created by keenteam on 2018/3/30.
//  Copyright © 2018年 keenteam. All rights reserved.
//

#import "TKHomeNew_serviceViewCell.h"
#import "UIImageView+WebCache.h"
#import <Masonry.h>

@interface TKHomeNew_serviceViewCell ()

@property (nonatomic, strong)UIImageView* imageV;

@property (nonatomic, strong)UILabel* tabImgLabel;

@end

@implementation TKHomeNew_serviceViewCell

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUI];
    }
    return self;
}

//ui设置
- (void) setUI{
    
    [self.contentView addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    
    [self.imageV addSubview:self.tabImgLabel];
    [self.tabImgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.height.equalTo(@22.5);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    
}

#pragma mark --- 数据
-(void)setModel:(YXHomeAdvertisementModel *)model{
    _model = model;
    NSString* advertisemrntStr =@"";
    NSURL  *picturesImageURL = [NSURL URLWithString:advertisemrntStr];
    [self.imageV sd_setImageWithURL:picturesImageURL placeholderImage:[UIImage imageNamed:@"bao_zhuang"]];
    
    self.tabImgLabel.text = model.advertisementNm;
}

#pragma mark --- 懒加载
-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
        _imageV.layer.borderColor = [UIColor colorWithRed:138 green:138 blue:138 alpha:1.0].CGColor;
    }
    return _imageV;
}

#pragma mark --- 懒加载
-(NSMutableArray *)mutableArr{
    if (!_mutableArr) {
        _mutableArr = [[NSMutableArray alloc]init];
    }
    return _mutableArr;
}

#pragma mark --- 懒加载
-(UILabel *)tabImgLabel{
    if (!_tabImgLabel) {
        _tabImgLabel = [[UILabel alloc]init];
        _tabImgLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        _tabImgLabel.textColor = [UIColor whiteColor];
        _tabImgLabel.font = [UIFont systemFontOfSize:13];
        _tabImgLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tabImgLabel;
}



@end
