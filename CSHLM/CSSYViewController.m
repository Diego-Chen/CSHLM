//
//  CSSYViewController.m
//  CSHLM
//
//  Created by CHENSHANGMAC on 16/8/26.
//  Copyright © 2016年 CHENSHANGMAC. All rights reserved.
//

#import "CSSYViewController.h"


@interface CSSYViewController ()

@end


@implementation CSSYViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
    UIView *view = [[UIView alloc]init ];
    view.frame = CGRectMake(0, 0, WIDTH, 44);
    
    
    self.navigationItem.titleView = view;
    
    
    UIImageView *vi = [[UIImageView alloc]init ];
    vi.image = [UIImage imageNamed:@"logo@2x.png"];
    [view addSubview:vi];
    [vi makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.top).offset(10);
        make.left.equalTo(view.left).offset(15);
        make.width.equalTo(50);
        make.bottom.equalTo(view.bottom).offset(-10);
    }];
    
    
 
    
    UIButton *subView = [[UIButton alloc]init ];
    
    
    
    
    
    [subView setImage:[UIImage imageNamed:@"home_nav_searchbar@2x.png"] forState:UIControlStateNormal];
    
    [subView addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];


    
    
    [view addSubview:subView];
    [subView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.top).offset(8);
        make.bottom.equalTo(view.bottom).offset(-8);
        make.left.equalTo(vi.right).offset(10);
        make.right.equalTo(view.right).offset(-10);
    }];
    

    
    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self requestData];
    
    
   
}
/**
 *  数据
 */
-(void)requestData
{
    //位于状态栏的旋转图标
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    //数据返回格式
    manger.responseSerializer = [AFHTTPResponseSerializer serializer ];
    
    [manger GET:SYLBURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error ;
        
        id objc = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        
        
        if (!error)
        {
            
            
            [self.imagesArray removeAllObjects ];
            for (NSDictionary *dict in objc[@"results"])
            {
                [self.imagesArray addObject:dict[@"focus_image"]];
            }
            
            
             [self layoutUI];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
}


/**
 *  布局
 */
-(void)layoutUI
{
    

    [self setLBImageViews];
    

    
   
    
    
    NSArray *imags  = @[@"v5_brand@2x.png",@"v5_category@2x.png",@"v5_orders@2x.png",@"v5_favorite@2x.png"];
    NSArray *titles = @[@"品牌",@"分类",@"我的订单",@"我的收藏"];
    
    float w = WIDTH / 4.0;
    
    for (int i = 0 ; i < 4 ; i ++ )
    {
        
        UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*w, 130, w, 100);
      
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.tag = BASETAG + i;
        [button setImage:[UIImage imageNamed:imags[i]] forState:UIControlStateNormal ];
        [button.titleLabel  setFont:[UIFont systemFontOfSize:12]];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(20, (w-60)/2.0 , 40, (w-60)/2.0)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(80, -w/2.0, 20, 0)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        
    }
    
   // [self drawRect:CGRectMake(0, 250, WIDTH, 1)];
    UILabel *label = [[UILabel alloc]init ];
    label.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    label.frame = CGRectMake(0, 230, WIDTH, 1.0);
    [self.scrollView addSubview:label];
    
    UIButton *buttonP = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonP.frame = CGRectMake(0, 231, WIDTH, 29);
    [buttonP setTitle:@"评价，晒单有好礼" forState:UIControlStateNormal];
    buttonP.titleLabel.textAlignment = NSTextAlignmentLeft;
    [buttonP setTitleColor:[UIColor  colorWithRed:88/255.0 green:94/255.0 blue:106/255.0 alpha:1.0  ] forState:UIControlStateNormal];
    buttonP.tag = BASETAG + 4 ;
    [buttonP.titleLabel setFont:[UIFont systemFontOfSize:13] ];
    buttonP.titleLabel.textAlignment = NSTextAlignmentLeft;
    [buttonP setImage:[UIImage imageNamed:@"home_advert_icon@2x.png"] forState:UIControlStateNormal ];
    [buttonP setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, WIDTH-5-29)];
    [buttonP setTitleEdgeInsets:UIEdgeInsetsMake(0, -(WIDTH - 34)/2.0 - 50, 0, 0)];
    [self.scrollView addSubview:buttonP];
    
    
    UILabel *lab  = [[UILabel alloc]init ];
    lab.backgroundColor = [UIColor  colorWithRed:176/255.0 green:224/255.0 blue:230/255.0 alpha:1.0];
    [self.scrollView addSubview:lab];
    [lab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonP.bottom);
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.height.equalTo(10);
    }];
    
    
    
    [self layoutView ];
}
/**
 *  圆角划线
 *
 *  @param rect <#rect description#>
 */
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetRGBStrokeColor(context, 0.314, 0.486, 0.859, 1.0);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 250);
    CGContextAddLineToPoint(context, WIDTH, 250);
    CGContextStrokePath(context);
}

-(void)layoutView
{
/*    
 http://platform.okbuy.com/app/v14/focus/advert?
      app_id=1034 & auth_sign=3896242cf513f32e26b39de92c8ed775 &  device_model=iPhone%206%20Plus%20%28A1522%2FA1524%29 &device_resolution=414%2A736&os=ios& page_id=4&session_id=F337F588-CE68-4787-9C56-AA7F8481958A&site_mask=6&version=4.5.2
 */
    
    /*
     http://platform.okbuy.com/app/v14/focus/advert?app_id=1034&auth_sign=3896242cf513f32e26b39de92c8ed775&device_model=iPhone%206%20Plus%20%28A1522%2FA1524%29&device_resolution=414%2A736&os=ios&page_id=4&session_id=F337F588-CE68-4787-9C56-AA7F8481958A&site_mask=6&version=4.5.2
     */
         //初始化manager
         AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
         //序列化
         manager.responseSerializer = [AFHTTPResponseSerializer serializer];
         //POST请求
         NSString *url = @"http://platform.okbuy.com/app/v14/focus/advert";
         NSDictionary *mdic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1034],@"app_id",
                                                                         @"3896242cf513f32e26b39de92c8ed775",@"auth_sign",
                               
                                                                         @"iPhone 6 Plus (A1522/A1524)",@"device_model",
                                                                         @"414*736",@"device_resolution",
                                                                         @"ios",@"os",
                                                                         [NSNumber numberWithInt:4],@"page_id",
                                                                         @"F337F588-CE68-4787-9C56-AA7F8481958A",@"session_id",
                                                                         [NSNumber numberWithInt:6],@"site_mask",
                                                                         @"4.5.2",@"version",
                                                                         nil];
         [manager POST:url parameters:mdic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
             } progress:^(NSProgress * _Nonnull uploadProgress) {
                     //数据接收进度
                 } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         // 请求成功，解析数据
                         NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
                
                         NSArray *array = dic[@"results"];
                         
                         for (NSDictionary *dict in array)
                         {
                             SYModel *model = [[SYModel alloc] init]; //WithDictionary:dict
                             
                             [model setValuesForKeysWithDictionary:dict ];
                             
                             [self.dataArray addObject:model ];
                             
                             
                             
                         }
                     
                     
                     
                         [self setImageViewS];
                
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                             // 请求失败
                         }];
    
}

-(void)setImageViewS
{
    self.scrollView.contentSize = CGSizeMake(0, 270  + 211.5  * self.dataArray.count);
    
    for (int i= 0; i<self.dataArray.count; i++)
    {
        SYView *view = [[SYView alloc] init];
        view.frame = CGRectMake(0, 270+i*211.5, WIDTH, 211.5);;
      
        [view setLeftAndRightAndImage:self.dataArray[i]];
        
        [self.scrollView addSubview:view];
        
        
        
    }

    
    
    
    [self toTopView];
    
    
    
    
    
    
    
}

-(void)toTopView
{//{/Users/CSMAC/Desktop/项目/CSHLM/CSHLM/图标/return_top_num_icon@2x.png
    _toTopVC = [[UIView alloc] init ];
    _toTopVC.frame = CGRectMake(WIDTH - 11 - 40, HEIGHT - 49 - 10 - 40, 40, 40);
    
    
    [self.view addSubview:_toTopVC ];
    
    
    
    
        _fenToTop = [[UIView alloc]init ];
        [_toTopVC addSubview:_fenToTop];
        [_fenToTop makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_toTopVC.top);
            make.left.equalTo(_toTopVC.left);
            make.right.equalTo(_toTopVC.right);
            make.bottom.equalTo(_toTopVC.bottom);
        }];

    
        UIImageView *v = [[UIImageView alloc] init];
        v.image = [UIImage imageNamed:@"return_top_num_icon@2x.png"];
        v.layer.cornerRadius = 20.0;
        v.layer.masksToBounds = YES;
        [_fenToTop addSubview:v];
        [v makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_fenToTop.top);
            make.left.equalTo(_fenToTop.left);
            make.right.equalTo(_fenToTop.right);
            make.bottom.equalTo(_fenToTop.bottom);
        }];
        UILabel *lb = [[UILabel alloc] init ];
        lb.text = [NSString stringWithFormat:@"%d",(int)self.dataArray.count];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.textColor = [UIColor purpleColor];
        lb.font = [UIFont systemFontOfSize:10];
        [_fenToTop addSubview:lb];
        [lb makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_fenToTop.centerX);
            make.top.equalTo(_fenToTop.centerY).offset(2);
            make.width.equalTo(15);
            make.height.equalTo(15);
        }];
    
        _toTopLabel = [[UILabel alloc] init ];
        _toTopLabel.text = @"0";
        _toTopLabel.textAlignment = NSTextAlignmentCenter;
        _toTopLabel.textColor = [UIColor purpleColor];
        _toTopLabel.font = [UIFont systemFontOfSize:10];
        [_fenToTop addSubview:_toTopLabel];
        [_toTopLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_fenToTop.centerX);
            make.bottom.equalTo(_fenToTop.centerY).offset(-2);
            make.width.equalTo(15);
            make.height.equalTo(15);
        }];
    
    
    
    _buttonToTop = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonToTop setImage:[UIImage imageNamed:@"return_top_icon@2x.png"] forState:UIControlStateNormal];
    [_buttonToTop addTarget:self action:@selector(toTopClick) forControlEvents:UIControlEventTouchUpInside];
    [_toTopVC addSubview:_buttonToTop ];
    [_buttonToTop makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_toTopVC.top);
        make.left.equalTo(_toTopVC.left);
        make.right.equalTo(_toTopVC.right);
        make.bottom.equalTo(_toTopVC.bottom);
    }];
    
    
    
    _toTopVC.hidden = YES;
    _fenToTop.hidden = YES;
    _buttonToTop.hidden = YES;
    
    

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
   
    
    float h = (scrollView.contentOffset.y + 211.5*1.3) / 211.5;
    
    int old = (int)h + 1;
    
    if (old >= 5)
    {
        if (_toTopVC || _fenToTop)
        {
            _toTopVC.hidden = NO;
            _fenToTop.hidden = NO;
            _buttonToTop.hidden = YES;
        }
    
        _toTopLabel.text = [NSString stringWithFormat:@"%d",old];
    }else
    {
        _toTopVC.hidden = YES;
        _fenToTop.hidden = YES;
        _buttonToTop.hidden = YES;
    }
}


//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
        float h = (scrollView.contentOffset.y + 211.5*1.3) / 211.5;
    
        int old = (int)h + 1;
    
        if (old >= 5)
        {
            if (_toTopVC || _buttonToTop)
            {
                _toTopVC.hidden = NO;
                _buttonToTop.hidden = NO;
                _fenToTop.hidden = YES;
            }
    
    
        }else
        {
            _toTopVC.hidden = YES;
            _buttonToTop.hidden = YES;
            _fenToTop.hidden = YES;
        }
}




-(void)toTopClick{
    
    
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

-(void)buttonClick:(UIButton *)button
{
    
    
    int index = (int )button.tag - BASETAG;
    switch (index) {
        case 0:
        {
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4: //晒单有礼
        {
            
        }
            break;
        default:
            break;
    }
}



-(void)setLBImageViews
{
    _leftImageView = [[UIImageView alloc] init];
    _leftImageView.frame = CGRectMake(0, 0, WIDTH, 130);
    
 
    
    _leftImageView.backgroundColor = [UIColor blueColor];
   // _leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.LBScrollView addSubview:_leftImageView ];
    
    
    _centerImageView = [[UIImageView alloc]init ];
    _centerImageView.frame = CGRectMake(WIDTH, 0, WIDTH, 130);
    _centerImageView.backgroundColor = [UIColor yellowColor];
  //  _centerImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.LBScrollView addSubview:_centerImageView];
    
    _rightImageView = [[UIImageView alloc] init ];
    _rightImageView.frame = CGRectMake(2*WIDTH, 0, WIDTH, 130);
    _rightImageView.backgroundColor = [UIColor greenColor];
   //   _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.LBScrollView addSubview:_rightImageView];
    
    
    
    _pageControl = [[UIPageControl alloc] init ];

    CGSize size = [_pageControl sizeForNumberOfPages:self.imagesArray.count]; //此方法能根据页数有效返回控件合适的大小
    _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    _pageControl.center = CGPointMake(WIDTH / 2.0, 120);
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];//当前页颜色
    _pageControl.numberOfPages = self.imagesArray.count ;  //总页数
    [self.scrollView addSubview:_pageControl ];
    
    int count = (int)self.imagesArray.count ;
    
    
    [_centerImageView sd_setImageWithURL:[NSURL URLWithString: self.imagesArray[0]] ];
    
    
    if (self.imagesArray.count > 1)
    {
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:self.imagesArray[count - 1]]];
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:self.imagesArray[1]] ];
    }
    _currentImageIndex = 0;
    _pageControl.currentPage = 0;
    
    
    
    [self loopLB];//开启定时器
}
-(void)loopLB
{
    _timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

-(void)timerClick
{
    int leftIndex ;
    int rightIndex;
    int count = (int)self.imagesArray.count;
    _currentImageIndex = (_currentImageIndex + 1) % self.imagesArray.count;
    [_centerImageView sd_setImageWithURL:[NSURL URLWithString:self.imagesArray[_currentImageIndex]]];
    
    leftIndex = (_currentImageIndex + count - 1 )% count;
    rightIndex = (_currentImageIndex + 1)% count ;
    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:self.imagesArray[leftIndex]]];
    [_rightImageView sd_setImageWithURL:[NSURL URLWithString:self.imagesArray[rightIndex]]];
    
    //[];
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [_centerImageView.layer addAnimation:animation forKey:nil];
    
    _pageControl.currentPage = _currentImageIndex;
    
    
}

-(void)tapClick:(UITapGestureRecognizer *)tap
{

}


-(void)searchClick
{
    
}

/**********************************************************************************/


-(NSMutableArray *)imagesArray
{
    if (!_imagesArray)
    {
        _imagesArray = [[NSMutableArray alloc]init ];
    }
    return _imagesArray;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        
        UIScrollView *sc  = [[UIScrollView alloc]init ];
       
        
        sc.delegate = self;
        sc.contentSize = CGSizeMake(WIDTH , 2*(HEIGHT - 64 - 49 ));
        

       

       
        sc.showsVerticalScrollIndicator = NO;
        
        sc.frame  = CGRectMake(0, 64, WIDTH, HEIGHT - 64 - 49);
       
     
        
        [self.view addSubview:sc ];

       
        
        _scrollView = sc ;
        
        

    }
    return _scrollView;
}



-(UIScrollView *)LBScrollView
{
    if (!_LBScrollView)
    {
     
        UIScrollView *sc  = [[UIScrollView alloc] init ];
        
        
        
        
        
        [self.scrollView addSubview:sc];
       
        
       
        
        sc.frame = CGRectMake(0 ,  0,  WIDTH, 129);
        
      //  sc.delegate = self;
        sc.contentSize = CGSizeMake(WIDTH * self.imagesArray.count, 0);
        [sc setContentOffset:CGPointMake(WIDTH, 0) animated:NO];
        sc.pagingEnabled = YES;
        sc.showsHorizontalScrollIndicator = NO;
        
        
        
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [sc addGestureRecognizer:tapGesture];
        
        
        

        
    
        _LBScrollView = sc;
        
    }
    return _LBScrollView;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc]init ];
        
    }
    return _dataArray;
}




-(void)dealloc
{
    [_timer invalidate ];
    _timer = nil;
    
}


@end
