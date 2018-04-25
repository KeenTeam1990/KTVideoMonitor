//
//  TKHomeNew_serviceViewCell.h
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

#import <UIKit/UIKit.h>
#import "YXHomeAdvertisementModel.h"

#define TKHomeNew_serviceViewCellIndentify @"TKHomeNew_serviceViewCellIndentify"

@interface TKHomeNew_serviceViewCell : UICollectionViewCell

@property (nonatomic, strong)YXHomeAdvertisementModel* model;
@property (nonatomic, strong)NSMutableArray* mutableArr;

@end
