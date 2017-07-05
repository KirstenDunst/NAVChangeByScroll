//
//  ViewController.m
//  NAVChangeByScroll
//
//  Created by CSX on 2017/7/4.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIView *topView1;
    UIView *topView2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createView];
    
}
- (void)createView{
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scroll.delegate = self;
    scroll.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scroll];
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    
//    制作显示用
    for (int i = 0; i<3; i++) {
        UIView *bgView = [[UIView alloc]init];
        bgView.frame = CGRectMake(0, self.view.frame.size.height*2/4*(i+1)-10, self.view.frame.size.width, 20);
        bgView.backgroundColor = [UIColor redColor];
        [scroll addSubview:bgView];
    }
   
//    导航头视图1
    topView1 = [[UIView alloc]init];
    topView1.frame = CGRectMake(0, 0, 200, 40);
    topView1.backgroundColor = [UIColor orangeColor];
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 80, 40);
    label.text = @"导航头1";
    label.backgroundColor = [UIColor blueColor];
    label.textAlignment = 1;
    [topView1 addSubview:label];
    self.navigationItem.titleView = topView1;
    
//    导航头视图2
    topView2 = [[UIView alloc]init];
    topView2.frame = CGRectMake(0, 0, 230, 40);
    topView2.backgroundColor = [UIColor cyanColor];
    UILabel *label2 = [[UILabel alloc]init];
    label2.frame = CGRectMake(60, 0, 80, 40);
    label2.text = @"导航头2";
    label2.backgroundColor = [UIColor blueColor];
    label2.textAlignment = 1;
    [topView2 addSubview:label2];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@">>>>>>>>>>>>%f",scrollView.contentOffset.y);
//    修改清晰度和导航头一起展示做到替换渐进的效果，可以后期再添加自己的一个界限，超过范围的话改变偏移处理（这样就可以达到支付宝类似的导航头的处理方法）
//    if (fabs(scrollView.contentOffset.y)<=64.0) {
//         self.navigationItem.titleView.alpha = fabs(scrollView.contentOffset.y/64.0);
//        
//    }else{
//        self.navigationItem.titleView.alpha = 1;
//    }
   
    //    更换导航界面视图头
    if (scrollView.contentOffset.y>0) {
        self.navigationItem.titleView = topView2;
        self.navigationItem.titleView.alpha = fabs(scrollView.contentOffset.y/64.0);
    }else{
        self.navigationItem.titleView = topView1;
        self.navigationItem.titleView.alpha = fabs(scrollView.contentOffset.y/64.0);
    }

    
//    修改导航条背景颜色渐变
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:127/255.0 green:((int)fabs(scrollView.contentOffset.y)%255)/(255.0) blue:((int)fabs(scrollView.contentOffset.y)%255)/(255.0) alpha:1];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
