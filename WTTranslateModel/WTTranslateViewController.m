//
//  WTTranslateViewController.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTTranslateViewController.h"
#import "WTTranslateBottomView.h"
#import "WTTranslateOtherCell.h"
@interface WTTranslateViewController ()
//底部栏
@property (nonatomic,strong) WTTranslateBottomView *bottomView;
@end

@implementation WTTranslateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    WT(bself);
    WTAddNotification(@"LanguageChanged", @selector(changeLanguage));
    self.emptyDataIcon = [[WTLanguageUtil shareInstance] valueForKey:@"ic_trans_empty_view"];
    [self setControllerTitle];
    self.formManager[@"WTTranslateOtherItem"] = @"WTTranslateOtherCell";
    //录音栏
    _bottomView = [[WTTranslateBottomView alloc] init];
    _bottomView.refreshTable = ^{
        [bself initForm];
    };
    [self.view addSubview:_bottomView];
}

- (void)setControllerTitle {
    self.navBar.title = [[WTLanguageUtil shareInstance] valueForKey:@"translate_title"];
}

- (void)initForm {
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
//    NSMutableArray *ar = [WTIFlyTekDataTool getVoiceData];
//    for (int i = 0; i < ar.count; i++) {
//        NSDictionary *dic = ar[i];
//        WTTranslateOtherItem *it = [[WTTranslateOtherItem alloc] init];
//        it.orgText = [WTUtil strRelay:dic[@"orginalLanguage"]];
//        it.resultText = [WTUtil strRelay:dic[@"resultLanguage"]];
//        it.cellHeight = [WTTranslateOtherItem getItemCellHeight:[WTUtil strRelay:dic[@"orginalLanguage"]] dest:[WTUtil strRelay:dic[@"resultLanguage"]]];
//        it.cellType = 1;
//        if ([[WTUtil strRelay:dic[@"voiceType"]] isEqualToString:@"me"]) {
//            it.cellType = 0;
//        }
//        [section0 addItem:it];
//    }
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
    
//    if (ar.count>0)
//    {
//        [self.formTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:ar.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//    }
    [self.formTable reloadEmptyDataSet];
}

- (void)changeLanguage{
    self.emptyDataIcon = [[WTLanguageUtil shareInstance] valueForKey:@"ic_trans_empty_view"];
    [self.navBar layoutSubviews];
}

@end
