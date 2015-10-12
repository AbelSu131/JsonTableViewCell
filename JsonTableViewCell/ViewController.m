//
//  ViewController.m
//  JsonTableViewCell
//
//  Created by abel on 15/10/12.
//  Copyright © 2015年 abel. All rights reserved.
//

#import "ViewController.h"
#define sizeWidth [UIScreen mainScreen].bounds.size.width
#define sizeHeight [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_listarr;//定义一个存放数据的容器
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0.72 blue:0.69 alpha:1];//设置导航栏背景颜色
    //设置导航栏字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    self.title = @"JsonTableViewCell";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSError *error;

    [self initViews];
    [self initJson];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initJson{
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.touzhu.cn/ex_jc.aspx?state=0&ifgetclass=1"]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
    
    //获取list的内容
    NSArray *list = [dic objectForKey:@"list"];
    NSLog(@"list数组的内容为 --> %@",list);
    //初始化成员变量
    _listarr = [[NSMutableArray alloc]init];
    //遍历数组list里面的内容
    for(int i=0;i<[list count];i++){
        //按数组中的索引取出对应的字典
        NSDictionary *listdic = [list objectAtIndex:i];
        //通过字典中的key取出对应value,并且强化为NSString类型
        NSString *teamname = (NSString *)[listdic objectForKey:@"name_j"];
        
        //将获取
    }
    
}





- (void)initViews{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,sizeWidth, sizeHeight) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}


@end
