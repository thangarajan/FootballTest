//
//  ViewController.m
//  FootBall
//
//  Created by  on 11/5/15.
//  Copyright © 2015 . All rights reserved.
//

#import "ViewController.h"
#import "gameTableViewCell.h"
#import <RestKit/RestKit.h>
#import "GameModel.h"
#import "SVProgressHUD.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * gameTableView;
    CGFloat screenWidth;
    CGFloat screenHeight;
    NSArray * objArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    gameTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, screenWidth, screenHeight - 20) style:UITableViewStylePlain];
    gameTableView.backgroundColor = [UIColor whiteColor];
    gameTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    gameTableView.delegate=self;
    gameTableView.dataSource=self;
    [self.view addSubview:gameTableView];
    [self gameService];

}

- (void)gameService{
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD show];
    
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[GameModel class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"homeTeamName":   @"homeTeamName",
                                                  @"awayTeamName":     @"awayTeamName",
                                                  @"result.goalsHomeTeam":        @"goalsHomeTeam",
                                                  @"result.goalsAwayTeam":        @"goalsAwayTeam",
                                                  @"status": @"status",
                                                  @"date": @"date"
                                                  }];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodGET pathPattern:nil keyPath:@"fixtures" statusCodes:nil];
    
    NSURL *url = [NSURL URLWithString:@"http://api.football-data.org/alpha/soccerseasons/398/fixtures"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            NSLog(@"The public timeline Tweets: %@", [result array]);
            if ([result array].count > 0) {
                objArr = [[NSArray alloc]initWithArray:[result array]];
                [gameTableView reloadData];

            }
        });
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismiss];
    }];
    [operation start];
}


- (void)loginSuccess:(NSData *)responseData{
}

#pragma mark - tableView Functions.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [objArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * overView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 25)];
    overView.backgroundColor = [UIColor darkGrayColor];
    
    UILabel * teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, screenWidth - 140, 30)];
    teamLabel.font = [UIFont boldSystemFontOfSize:18.0];
    teamLabel.backgroundColor = [UIColor clearColor];
    teamLabel.text = @"Teams";
    teamLabel.textColor = [UIColor whiteColor];
    [overView addSubview:teamLabel];
    
    UILabel * goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth - 120, 0, 60, 30)];
    goalLabel.font = [UIFont boldSystemFontOfSize:18.0];
    goalLabel.backgroundColor = [UIColor clearColor];
    goalLabel.textColor = [UIColor whiteColor];
    goalLabel.text = @"Goals";
    goalLabel.textAlignment = NSTextAlignmentCenter;
    [overView addSubview:goalLabel];
    
    UILabel * statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth - 60, 0, 60, 30)];
    statusLabel.font = [UIFont boldSystemFontOfSize:18.0];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.textColor = [UIColor whiteColor];
    statusLabel.text = @"Status";
    statusLabel.textAlignment = NSTextAlignmentCenter;
    [overView addSubview:statusLabel];
    
    return overView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"offerCell";
    
    // Similar to UITableViewCell, but
    gameTableViewCell *cell = (gameTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[gameTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    GameModel * modelObj = (GameModel *)[objArr objectAtIndex:indexPath.row];
    
    cell.hometeamLabel.text = modelObj.homeTeamName;
    cell.awayteamLabel.text = modelObj.awayTeamName;
    cell.homeTMgoalsLabel.text = modelObj.goalsHomeTeam;
    cell.awayTMgoalsLabel.text = modelObj.goalsAwayTeam;
    cell.dateLabel.text = modelObj.date;
    cell.homestatusLabel.text = modelObj.status;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
