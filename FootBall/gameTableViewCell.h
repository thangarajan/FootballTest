//
//  gameTableViewCell.h
//  FootBall
//
//  Created by  on 11/5/15.
//  Copyright © 2015 . All rights reserved.
//

#import <UIKit/UIKit.h>
//Show the details(home team, awayteam, status, goals, date/time) of all the games in a list
@interface gameTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel * hometeamLabel;
@property (nonatomic, strong) UILabel * awayteamLabel;
@property (nonatomic, strong) UILabel * homestatusLabel;
@property (nonatomic, strong) UILabel * homeTMgoalsLabel;
@property (nonatomic, strong) UILabel * awayTMgoalsLabel;
@property (nonatomic, strong) UILabel * dateLabel;

@end
