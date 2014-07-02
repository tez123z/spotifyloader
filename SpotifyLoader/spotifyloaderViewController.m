//
//  spotifyloaderViewController.m
//  SpotifyLoader
//
//  Created by Tom Evans on 7/2/14.
//  Copyright (c) 2014 Evotion Designs Inc. All rights reserved.
//

#import "spotifyloaderViewController.h"
#import "SpotyActivityView.h"

@interface spotifyloaderViewController (){
    SpotyActivityView *loader;
    IBOutlet UIButton *toggleBtn;
    IBOutlet UISegmentedControl *styleOption;
    IBOutlet UISegmentedControl *hidesOption;
}

@end

@implementation spotifyloaderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNewLoader];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)styleSwitched:(UISegmentedControl *)sender {
    
    BOOL wasAnimating = [loader isAnimating];
    [loader removeFromSuperview];
    [self createNewLoader];
    
    if(wasAnimating){
        [loader startAnimating];
    }
    
    
    
}

- (IBAction)hidingSwitched:(UISegmentedControl *)sender {
    
    [loader setHidesWhenAnimationStops:sender.selectedSegmentIndex];
}

- (IBAction)toggleTapped:(UIButton*)btn {
    
    if(loader && [loader isAnimating])
    {
        [btn setTitle:@"Start Animating" forState:UIControlStateNormal];
        [loader stopAnimating];
        
        if([loader hidesWhenAnimationStops])
            loader = nil;
        
        return;
    }
    
    if(!loader){
        [self createNewLoader];
    }
    
    [btn setTitle:@"Stop Animating" forState:UIControlStateNormal];
    [loader startAnimating];
}

- (void)createNewLoader{
    NSString *style = (styleOption.selectedSegmentIndex == 0)?@"black":@"gray";
    loader = [[SpotyActivityView alloc] initWithFrame:CGRectMake(70, (self.view.frame.size.height/2)-100, self.view.frame.size.width-140, 200) andStyle:style];
    
    [self.view addSubview:loader];
    [loader setHidesWhenAnimationStops:hidesOption.selectedSegmentIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
