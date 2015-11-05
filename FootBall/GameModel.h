//
//  GameModel.h
//  FootBall
//
//  Created by  on 11/5/15.
//  Copyright © 2015 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject

@property(nonatomic, copy)NSString * homeTeamName;
@property(nonatomic, copy)NSString * awayTeamName;
@property(nonatomic, copy)NSString * goalsHomeTeam;
@property(nonatomic, copy)NSString * goalsAwayTeam;
@property(nonatomic, copy)NSString * status;
@property(nonatomic, copy)NSString * date;

@end
