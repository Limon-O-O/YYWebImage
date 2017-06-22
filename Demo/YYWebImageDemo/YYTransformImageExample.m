//
//  YYTransformImageExample.m
//  YYWebImageDemo
//
//  Created by xuemin on 2017/6/22.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "YYTransformImageExample.h"
#import "UIImageView+YYWebImage.h"
#import "UIImage+YYWebImage.h"
#import "YYImageCache.h"
#import "YYMemoryCache.h"
#import "YYDiskCache.h"

@interface YYTransformImageExampleCell : UITableViewCell
@property (nonatomic, strong) UIImageView *avatar;
@end

@implementation YYTransformImageExampleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        {
            self.avatar = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2.0, 10, 100, 100)];
            [self.contentView addSubview:self.avatar];
            
        }
        
    }
    return self;
}

@end

@interface YYTransformImageExample ()
@property (nonatomic, assign) NSInteger dataRows;
@property (nonatomic, strong) NSMutableArray *borderColors;
@end

@implementation YYTransformImageExample

- (NSMutableArray *)borderColors {
    if (_borderColors == nil) {
        _borderColors = [[NSMutableArray alloc] init];
        
        [_borderColors addObject:[UIColor blueColor]];
        [_borderColors addObject:[UIColor orangeColor]];
        [_borderColors addObject:[UIColor redColor]];
        [_borderColors addObject:[UIColor yellowColor]];
        [_borderColors addObject:[UIColor purpleColor]];

    }
    return _borderColors;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     YYImageCache *cache = [YYWebImageManager sharedManager].cache;
    // clear cache
    [cache.memoryCache removeAllObjects];
    [cache.diskCache removeAllObjects];
    
    _dataRows = 100;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[YYTransformImageExampleCell class] forCellReuseIdentifier:@"CellWithIdentifier"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYTransformImageExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellWithIdentifier" forIndexPath:indexPath];
    NSInteger type = arc4random() % 5;
    
    UIColor *color = self.borderColors[type];
    
    [cell.avatar yy_setImageWithURL:[NSURL URLWithString:@"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1466318/getaway.jpg"] placeholder:[UIImage yy_imageWithColor:[UIColor lightGrayColor]] options:0 progress:nil transformType:type transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
    
        return [image yy_imageByRoundCornerRadius:50 borderWidth:10 borderColor:color];
    } completion:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.5;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
