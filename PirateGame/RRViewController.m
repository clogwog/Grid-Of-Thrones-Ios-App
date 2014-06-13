//
//  RRViewController.m
//  PirateGame
//
//  Created by tom schuring on 20/05/2014.
//
//

#import "RRViewController.h"
#import "RRTileFactory.h"

#include <stdlib.h>

@interface RRViewController ()

@end

@implementation RRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    [self setupGame];

}

- (void) setupGame
{
    self.currentTile = CGPointMake(0, 0);
    
    RRTileFactory* aTileFactory = [[RRTileFactory alloc] init];
    self.grid = aTileFactory.getGrid;
    
    NSLog(@"Result %@", self.grid);
    
    self.score = 50;
    [self updateCurrentGrid];
    
    
}

- (void) updateCurrentGrid
{
    
    NSString* as = [NSString stringWithFormat:@"%d,%d", (int)self.currentTile.x, (int)self.currentTile.y ];
    self.gridcoordinates.text  = as;
    
    // find the current location in the grid
    RRTile* wha = [self retrieveCurrentTile];
    
    // update the background, text and setup action buttons
    self.backgroundImage.image = wha.backgroundImage;
    if ( !wha.actioned)
        self.labelTileDescription.text = wha.description;
    else
        self.labelTileDescription.text = @"Move along now.\nNothing to see here.";
        
    // calculate and set the visibility of the arrows
    self.buttonLeft.hidden = self.currentTile.x <= 0    || (!wha.optional && ! wha.actioned) ;
    self.buttonRight.hidden = self.currentTile.x >= 3   || (!wha.optional && ! wha.actioned);
    self.buttonDown.hidden = self.currentTile.y <= 0    || (!wha.optional && ! wha.actioned);
    self.buttonUp.hidden = self.currentTile.y >= 2      || (!wha.optional && ! wha.actioned);
    
    if( wha.action1Description.length > 0 && !wha.actioned)
    {
        self.buttonAction1.hidden = NO;
        [self.buttonAction1 setTitle: wha.action1Description forState:UIControlStateNormal];
    }
    else
    {
        self.buttonAction1.hidden = YES;
        [self.buttonAction1 setTitle: @"" forState:UIControlStateNormal];
        
    }
    if( wha.action2Description.length > 0 && !wha.actioned )
    {
        self.buttonAction2.hidden = NO;
        [self.buttonAction2 setTitle: wha.action2Description forState:UIControlStateNormal];
    }
    else
    {
        self.buttonAction2.hidden = YES;
        [self.buttonAction2 setTitle: @"" forState:UIControlStateNormal];
    }
    
    NSString* scoreStr = [NSString stringWithFormat:@"%d", self.score ];
    self.labelHealth.text = scoreStr;
    
    if( self.score >= 100)
    {
        self.happyStateImage.image = [UIImage imageNamed:@"tyrion-smile.jpg"];
    }
    else if (self.score > 70)
    {
        self.happyStateImage.image = [UIImage imageNamed:@"tyrion_worried.jpg"];
    }
    else if (self.score > 30)
    {
        self.happyStateImage.image = [UIImage imageNamed:@"tyrion-hurt.jpg"];
    }
    else
    {
        self.happyStateImage.image = [UIImage imageNamed:@"tyrion-dirty.jpg"];
    }
    
    
    if( self.score <= 0 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"You dead!"
                                                        message: @"It's quite common here, but you \nseem to be dead..\nSorry and stuff.."
                                                       delegate:nil
                                              cancelButtonTitle:@"Restart"
                                              otherButtonTitles: nil];
        [alert show];
        
        [self setupGame];

    }
    
    if( [wha.description hasPrefix:@"Congratulations"] )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"You royal Highness "
                                                        message: wha.description
                                                       delegate:nil
                                              cancelButtonTitle:@"Restart"
                                              otherButtonTitles: nil];
        [alert show];
        
        [self setupGame];
    }
    
    
    
}

-(RRTile*) retrieveCurrentTile
{
    return self.grid[(int)self.currentTile.y][(int)self.currentTile.x];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)buttonAction2:(UIButton *)sender {
}

- (IBAction)buttonUpPressed:(UIButton *)sender {
    if( self.currentTile.y < 2 )
        self.currentTile = CGPointMake( self.currentTile.x   ,  self.currentTile.y + 1);
    [self updateCurrentGrid];
}

- (IBAction)buttonRightPressed:(UIButton *)sender {
    
    if( self.currentTile.x < 3)
        self.currentTile = CGPointMake( self.currentTile.x  + 1 ,  self.currentTile.y );
    [self updateCurrentGrid];
    
}

- (IBAction)buttonDownPressed:(UIButton *)sender {
    if( self.currentTile.y > 0 )
        self.currentTile = CGPointMake( self.currentTile.x   ,  self.currentTile.y - 1);
    [self updateCurrentGrid];
}

- (IBAction)buttonLeftPressed:(UIButton *)sender {
    if( self.currentTile.x != 0)
        self.currentTile = CGPointMake( self.currentTile.x  - 1 ,  self.currentTile.y );

    [self updateCurrentGrid];
}

- (IBAction)buttonAction1Pressed:(UIButton *)sender {
    // find the current location in the grid
    RRTile* wha = [self retrieveCurrentTile];
    wha.actioned = YES;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: wha.action1Description
                                                    message:wha.reaction1Description
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
    if( wha.action1Result > 0 )
        self.score += arc4random_uniform(fabs(wha.action1Result));
    else
        self.score -= arc4random_uniform(fabs(wha.action1Result));

    if( self.score < 0)
        self.score = 0;
    
    [self updateCurrentGrid];
}

- (IBAction)buttonActions2Pressed:(UIButton *)sender {

    // find the current location in the grid
    RRTile* wha = [self retrieveCurrentTile];
    wha.actioned = YES;

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: wha.action2Description
                                                    message:wha.reaction2Description
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
    if( wha.action2Result > 0 )
        self.score += arc4random_uniform(fabs(wha.action2Result));
    else
        self.score -= arc4random_uniform(fabs(wha.action2Result));
        
    if( self.score < 0)
        self.score = 0;
    
    [self updateCurrentGrid];
}
@end
