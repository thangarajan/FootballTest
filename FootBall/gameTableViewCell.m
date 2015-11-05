//
//  gameTableViewCell.m
//  FootBall
//
//  Created by  on 11/5/15.
//  Copyright © 2015 . All rights reserved.
//

#import "gameTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation gameTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        
        int iphone6Axis = 0;
        
        if (self.frame.size.width > 320) {
            iphone6Axis = 20;
        }
        self.hometeamLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width - 60 - iphone6Axis, 30)];
        self.hometeamLabel.font = [UIFont boldSystemFontOfSize:14.0];
        self.hometeamLabel.backgroundColor = [UIColor clearColor];
        self.hometeamLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:self.hometeamLabel];
        
        UILabel * vsLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width - 80)/2 - 20, 20, 30, 25)];
        vsLabel.text = @"Vs";
        vsLabel.backgroundColor = [UIColor clearColor];
        vsLabel.textColor = [UIColor redColor];
        [self addSubview:vsLabel];

        self.awayteamLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, self.frame.size.width - 60 - iphone6Axis, 30)];
        self.awayteamLabel.font = [UIFont boldSystemFontOfSize:14.0];
        self.awayteamLabel.backgroundColor = [UIColor clearColor];
        self.awayteamLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:self.awayteamLabel];
        
        self.homeTMgoalsLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 80 - iphone6Axis, 0, 30, 25)];
        self.homeTMgoalsLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.homeTMgoalsLabel.backgroundColor = [UIColor clearColor];
        self.homeTMgoalsLabel.textColor = [UIColor blueColor];
        [self addSubview:self.homeTMgoalsLabel];
        
        self.awayTMgoalsLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 80 - iphone6Axis, 40, 30, 25)];
        self.awayTMgoalsLabel.font = [UIFont boldSystemFontOfSize:18.0];
        self.awayTMgoalsLabel.backgroundColor = [UIColor clearColor];
        self.awayTMgoalsLabel.textColor = [UIColor blueColor];
        [self addSubview:self.awayTMgoalsLabel];
        
        self.homestatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, self.frame.size.height - 25, 60, 25)];
        self.homestatusLabel.font = [UIFont systemFontOfSize:11.0];
        self.homestatusLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.homestatusLabel];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, self.frame.size.width - 40, 15)];
        self.dateLabel.textAlignment = NSTextAlignmentCenter;
        self.dateLabel.font = [UIFont boldSystemFontOfSize:16.0];
        self.dateLabel.backgroundColor = [UIColor clearColor];
        self.dateLabel.textColor = [UIColor grayColor];
        [self addSubview:self.dateLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
