//
//  TabViewController.m
//  嘀拍
//
//  Created by JIng on 2017/5/9.
//  Copyright © 2017年 JIng. All rights reserved.
//

#import "TabViewController.h"



//主框架

#import "DitPoViewController.h"
#import "OrderViewController.h"
#import "MyViewController.h"


@interface TabViewController ()

@end

@implementation TabViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tabBar.hidden = YES;
    [self initViewControllers];
    [self initCustomTabBar];
}

-(void)showTabBar
{
    _tabBarBack.hidden=NO;
}


-(void)RewardActionNotInfo:(NSNotification *)info
{
    
    _tabBarBack.hidden=YES;
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}



- (void)initViewControllers{
    
 
    DitPoViewController  *ditpoVC=[[DitPoViewController alloc]init];
    
    OrderViewController  *OrderVC=[[OrderViewController alloc]init];
    
    MyViewController   *MyVC=[[MyViewController alloc]init];
    
    
    NSArray *array = @[ditpoVC, OrderVC, MyVC];
    _vcArrs = [[NSMutableArray alloc] init];
    [_vcArrs addObjectsFromArray:array];
    [self setViewControllers:_vcArrs animated:YES];
    
}


#pragma mark-自定义TabBar
- (void)initCustomTabBar{
    
    [_tabBarBack.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _tabBarBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.height-kTabBarHeight, KScreenWidth, kTabBarHeight)];
    _tabBarBack.backgroundColor = WhiteColor;
    
    _tabBarBack.userInteractionEnabled = YES;
    
    [self.view addSubview:_tabBarBack];
    
    
    UIView  *spearView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 1)];
    spearView.backgroundColor=kCyColorFromHex(0xdcdde1);
    [_tabBarBack addSubview:spearView];
    
    
    
    
    NSArray *arrImageNormal = @[@"tab-home-off",@"tab-car-off", @"tab-report-off",
                                @"tab-shezhi-off"];
    
    NSArray *arrImagePressed = @[@"tab-home-on", @"tab-car-on", @"tab-report-on",
                                 @"tab-shezhi-on"];
    
    NSInteger count = [_vcArrs count];
    
    
    
    for (int index = 0; index < count; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = index;
        button.frame = CGRectMake(index * (KScreenWidth/count), 6.5, (KScreenWidth/count), 36);
        [button setImage:[UIImage imageNamed:arrImageNormal[index]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:arrImagePressed[index]] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:arrImagePressed[index]] forState:UIControlStateSelected];
        
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        button.imageView.clipsToBounds = YES;
        
        [button addTarget:self action:@selector(changeTabBarButtonBackground:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarBack addSubview:button];
        
        if (button.tag==0) {
            
            button.selected=YES;
        }
        
        
    }
    
}

- (void)changeTabBarButtonBackground:(UIButton *)button {
    
    
    
    
    self.selectedIndex = button.tag;
    
    for (UIButton *btn in _tabBarBack.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn setSelected:NO];
        }
    }
    [button setSelected:YES];
    
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
