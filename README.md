spotifyloader
=============

A Spotify-Like UIView Loader for iOS
Built much like UIActivityIndicatorView

Usage:

    SpotyActivityView *loader = [[SpotyActivityView alloc] initWithFrame:CGRectMake(70, (self.view.frame.size.height/2)-100, self.view.frame.size.width-140, 200) andStyle:@"black"];
    [loader setHidesWhenAnimationStops:YES];
    [self.view addSubview:loader];
    [loader startAnimating];
    
