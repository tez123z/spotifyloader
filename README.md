spotifyloader
=============

A Spotify-Like UIView Loader for iOS
Built much like UIActivityIndicatorView

Installion:
	
	Download SpotyActivityView.h and SpotyActivityView.m and include in your project file (Requires ARC enabled)
Usage:

    SpotyActivityView *loader = [[SpotyActivityView alloc] initWithFrame:CGRectMake(70, (self.view.frame.size.height/2)-100, self.view.frame.size.width-140, 200) andStyle:@"black"];
    [loader setHidesWhenAnimationStops:YES];
    [self.view addSubview:loader];
    [loader startAnimating];
    
Methods:

	-(id)initWithFrame:(CGRect)frame andStyle:(NSString*)styleString; //two styles right now @"gray" and @"black" currently case-sensitive
	
	-(void)startAnimating; //Starts Animations
	
	-(void)stopAnimating; //Stops Animations
	
	-(void)setHidesWhenAnimationStops:(BOOL)boolean; //If set TRUE fades out and down upon stopping
