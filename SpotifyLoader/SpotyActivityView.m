//
//  SpotyActivityView.m
//  Sovi-iOS
//
//  Created by Tom Evans on 6/24/14.
//  Copyright (c) 2014 Trey Pringle. All rights reserved.
//

#import "SpotyActivityView.h"

@implementation SpotyActivityView{
    NSArray *loaderArray;
    NSString *style;
    int loaderIndex;
    BOOL isAnimating;
    BOOL forceStop;
}
@synthesize hidesWhenAnimationStops;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andStyle:(NSString*)styleString
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        style = styleString;
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
    self.backgroundColor = ([style isEqual:@"gray"])?[UIColor clearColor]:[UIColor blackColor];
    self.alpha = 0.7;
    self.layer.cornerRadius = 8;
    
    CGFloat startingPoint = ((self.frame.size.width/1.5)/6);
    
    //Initialize loaders scaling for 3 dots
    UIView *loaderOne = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width/6)+startingPoint-10, (self.frame.size.height/2)-10, 20, 20)];
    loaderOne.layer.cornerRadius = 10;
    loaderOne.backgroundColor = ([style isEqual:@"gray"])?[UIColor darkGrayColor]:[UIColor whiteColor];
    
    UIView *loaderTwo = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width/6)+(startingPoint*3)-10, (self.frame.size.height/2)-10, 20, 20)];
    loaderTwo.layer.cornerRadius = 10;
    loaderTwo.backgroundColor = ([style isEqual:@"gray"])?[UIColor darkGrayColor]:[UIColor whiteColor];
    
    UIView *loaderThree = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width/6)+(startingPoint*5)-10, (self.frame.size.height/2)-10, 20, 20)];
    loaderThree.layer.cornerRadius = 10;
    loaderThree.backgroundColor = ([style isEqual:@"gray"])?[UIColor darkGrayColor]:[UIColor whiteColor];
    
    //Add to loader array
    loaderArray = [[NSArray alloc] initWithObjects:loaderOne,loaderTwo,loaderThree,nil];
    loaderIndex = 0;
    
    [self addSubview:loaderOne];
    [self addSubview:loaderTwo];
    [self addSubview:loaderThree];
    
}

-(BOOL)isAnimating{
    return isAnimating;
}

-(void)startAnimating{
    
    // If forcing to stop reset properties then stop;
    if(forceStop){
        
        isAnimating = 0;
        forceStop = 0;
        return;
    }
    
    isAnimating = 1;
    
    //Grab view in appropriate index
    UIView *viewToAnimate = [loaderArray objectAtIndex:loaderIndex];
    
    [UIView animateWithDuration:.35 delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         //Scale view up
                         viewToAnimate.transform = CGAffineTransformMakeScale(1.3, 1.3);
                     } completion:^(BOOL finished){
                         [UIView animateWithDuration:.35 delay:0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              //Scale view back to 1
                                              viewToAnimate.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                          } completion:^(BOOL finished){
                                              //Increment index and try again
                                              loaderIndex = (loaderIndex == 2)?0:loaderIndex+1;
                                              [self startAnimating];
                                          }];
                     }];
}

-(void)stopAnimating{
    forceStop = 1;
    
    if(!hidesWhenAnimationStops)
        return;
        
    [UIView animateWithDuration:.55 delay:0.35
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                             
                             self.alpha = 0;
                             self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y+5, self.frame.size.width, self.frame.size.height);
                         
                     } completion:^(BOOL finished){
                         if(finished){
                              [self removeFromSuperview];
                         }
                         
                     }];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
