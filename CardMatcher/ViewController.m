//
//  ViewController.m
//  CardMatcher
//
//  Created by Ross Whyte on 4/6/15.
//  Copyright (c) 2015 Ross Whyte. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong,nonatomic) PlayingCardDeck * playingDeck;


@property (nonatomic) int flipCount;

@end

@implementation ViewController

-(void)setFlipCount:(int)flipCount{
    
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d",self.flipCount);
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    if(!_playingDeck){
        _playingDeck = [[PlayingCardDeck alloc] init];
    }
    
 
        if([sender.currentTitle length]){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                      forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
            NSLog(@"here");
            self.flipCount++;
        }
        else{
            Card * randomCard = [self.playingDeck drawRandomCard];
            if(randomCard){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:[randomCard contents] forState:UIControlStateNormal];
            NSLog(@"there");
            self.flipCount++;
            }
            
    
        }
        

}



@end
