//
//  RRTile.h
//  PirateGame
//
//  Created by tom schuring on 22/05/2014.
//
//

#import <Foundation/Foundation.h>

@interface RRTile : NSObject

@property (nonatomic,strong) UIImage* backgroundImage;
@property (nonatomic,strong) NSString* description;

@property (nonatomic) bool optional;
@property (nonatomic) bool actioned;

@property (nonatomic) int action1Result;
@property (nonatomic,strong) NSString* action1Description;
@property (nonatomic,strong) NSString* reaction1Description;


@property (nonatomic) int action2Result;
@property (nonatomic,strong) NSString* action2Description;
@property (nonatomic,strong) NSString* reaction2Description;


@end
