//
//  RRViewController.h
//  PirateGame
//
//  Created by tom schuring on 20/05/2014.
//
//

#import <UIKit/UIKit.h>
#import "RRTile.h"

@interface RRViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIImageView *happyStateImage;

@property (strong, nonatomic) IBOutlet UILabel *labelHealth;
@property (strong, nonatomic) IBOutlet UILabel *labelTileDescription;

@property (strong, nonatomic) IBOutlet UIButton *buttonUp;
@property (strong, nonatomic) IBOutlet UIButton *buttonRight;
@property (strong, nonatomic) IBOutlet UIButton *buttonDown;
@property (strong, nonatomic) IBOutlet UIButton *buttonLeft;
@property (strong, nonatomic) IBOutlet UIButton *buttonAction1;
@property (strong, nonatomic) IBOutlet UIButton *buttonAction2;
@property (strong, nonatomic) IBOutlet UILabel *gridcoordinates;

@property (nonatomic) CGPoint currentTile;
@property (nonatomic) int score;


@property  (strong,nonatomic) NSMutableArray* grid;


- (IBAction)buttonUpPressed:(UIButton *)sender;
- (IBAction)buttonRightPressed:(UIButton *)sender;
- (IBAction)buttonDownPressed:(UIButton *)sender;
- (IBAction)buttonLeftPressed:(UIButton *)sender;
- (IBAction)buttonAction1Pressed:(UIButton *)sender;
- (IBAction)buttonActions2Pressed:(UIButton *)sender;


- (void) updateCurrentGrid;
-(RRTile*) retrieveCurrentTile;
- (void) setupGame;


@end
