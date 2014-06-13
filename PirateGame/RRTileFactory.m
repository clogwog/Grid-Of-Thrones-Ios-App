//
//  RRTileFactory.m
//  PirateGame
//
//  Created by tom schuring on 22/05/2014.
//
//

#import "RRTileFactory.h"

@implementation RRTileFactory

-(NSMutableArray*) getGrid
{
    NSMutableArray* retValue = [[NSMutableArray alloc] init];
    
    NSMutableArray* rowArray = [[NSMutableArray alloc] init];
    
    RRTile* startTile = [[RRTile alloc] init];
    //----------------------------------------------
    startTile.description = [NSString stringWithFormat: @"You have just arrived on the Grid of Thrones. Find your way to the throne. Make your move, just remember\nThere Be Dragons !!"];
    startTile.backgroundImage = [UIImage imageNamed:@"map.jpg"];
    startTile.optional = YES;
    startTile.actioned = NO;
    startTile.action1Result = 0;
    startTile.action1Description = @"";
    [rowArray addObject:startTile];
    
    RRTile* aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"Hodor !! Hodor ?! Hodor !?\n(I think he's offering you a lift)\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"hodor.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    aTile.action1Result = 70;
    aTile.action1Description = @"Take Lift";
    aTile.reaction1Description = @"Hey this is good !";
    [rowArray addObject:aTile];
    
    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"You ran into Ghost. He's growling and showing his teeth.\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"ghost.jpg"];
    aTile.optional = NO;
    aTile.actioned = NO;
    
    aTile.action1Result = -70;
    aTile.action1Description = @"Fight";
    aTile.reaction1Description = @"What is wrong with you ? that direwolf is bigger than you ! AAAAahhh ..down boy ! DOWN !";
    
    aTile.action2Result = 10;
    aTile.action2Description = @"Back away slowly";
    aTile.reaction2Description = @"Ah, a dog person i see.. Smart move.";

    [rowArray addObject:aTile];

    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"2 Words, White Walkers.\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"whitewalker.jpg"];
    aTile.optional = NO;
    aTile.actioned = NO;
    aTile.action1Result = -50;
    aTile.action1Description = @"Fight";
    aTile.reaction1Description = @"... speechless... ";
    
    aTile.action2Result = -20;
    aTile.action2Description = @"Run!";
    aTile.reaction2Description = @"Faster !!";

    [rowArray addObject:aTile];

    [retValue addObject:rowArray];
   
    //----------------------------------------------
    rowArray = [[NSMutableArray alloc] init];

    
    
    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"You have been offered to become hand of the king\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"hand-of-the-king-pin-usb.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    aTile.action1Result = 35;
    aTile.action1Description = @"Accept";
    aTile.reaction1Description = @"M'lord";

    [rowArray addObject:aTile];

    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"The Wall\nLooks cold.\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"thewall.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    aTile.action1Result = -30;
    aTile.action1Description = @"Climb";
    aTile.reaction1Description = @"Alright.. this is going to take a little while";

    [rowArray addObject:aTile];

    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"I told you so... DRAGONS !!\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"dragon.jpg"];
    aTile.optional = NO;
    aTile.actioned = NO;
    aTile.action1Result = -130;
    aTile.action1Description = @"Fight";
    aTile.reaction1Description = @"Ze goggles.. zey do nossing !!! AAaaaaah";

    aTile.action2Result = -50;
    aTile.action2Description = @"Run!";
    aTile.reaction2Description = @"Run Forrest...Run !!!";

    [rowArray addObject:aTile];
    
    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"Boats arrived in blackwater bay.\nWhat do you want to do?"];
    aTile.backgroundImage = [UIImage imageNamed:@"battleofblackwater.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    aTile.action1Result = 50;
    aTile.action1Description = @"Wildfire!!";
    aTile.reaction1Description = @"Burn baby burn..";

    [rowArray addObject:aTile];
    
    [retValue addObject:rowArray];
    
    //----------------------------------------------
    rowArray = [[NSMutableArray alloc] init];
    
    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"Winterfell... Oooooh pretty"];
    aTile.backgroundImage = [UIImage imageNamed:@"Winterfell_Exterior.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    [rowArray addObject:aTile];

    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"Winterfell... Oooooh pretty2"];
    aTile.backgroundImage = [UIImage imageNamed:@"Winterfell_Exterior.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    [rowArray addObject:aTile];

    
    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"Winterfell... Oooooh pretty3"];
    aTile.backgroundImage = [UIImage imageNamed:@"Winterfell_Exterior.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    [rowArray addObject:aTile];


    aTile = [[RRTile alloc] init];
    aTile.description = [NSString stringWithFormat: @"Congratulations, you made it to the throne"];
    aTile.backgroundImage = [UIImage imageNamed:@"iron-throne.jpg"];
    aTile.optional = YES;
    aTile.actioned = NO;
    [rowArray addObject:aTile];

   
    [retValue addObject:rowArray];
    
    
    return retValue;
}

@end
