//
//  SpotyActivityView.h
//  Sovi-iOS
//
//  Created by Tom Evans on 6/24/14.
//  Copyright (c) 2014 Trey Pringle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotyActivityView : UIView
@property (atomic,assign) BOOL hidesWhenAnimationStops;
- (id)initWithFrame:(CGRect)frame andStyle:(NSString*)styleString;
-(void)startAnimating;
-(void)stopAnimating;
-(BOOL)isAnimating;
-(void)setHidesWhenAnimationStops:(BOOL)boolean;
@end
