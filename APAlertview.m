//
//  APAlertview.m
//  APAlertViewSampleProject
//
//  Created by Ali Pourhadi on 3/13/14.
//  Copyright (c) 2014 AliPourhadi. All rights reserved.
//

#define titleFontSize 15
#define messageFontSize 14
#define alerViewWidth 230
#define alertViewHeight 110

#import "APAlertview.h"
@interface APAlertview ()
{
	UIView* backgroundView;
	UIView* alertView;
	UILabel* titleLabel;
	UILabel* messageLabel;
}
@property id <APAlertviewDelegate> delegate;
@end

@implementation APAlertview



-(id)initLoadingAlertViewWithTitle:(NSString *)alertTitle message:(NSString *)alertMessage delegate:(id)delegate loadingColor:(UIColor *)loadingColor
{
	self = [super init];
    if (self) {
		[self makeDefaultAlertViewWithTitle:alertTitle andMessage:alertMessage];
		UIActivityIndicatorView *  loadingActivity  = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
		loadingActivity.center = CGPointMake(messageLabel.center.x, messageLabel.center.y + 50);
		[loadingActivity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
		[loadingActivity setColor:[UIColor blackColor]];
		[loadingActivity startAnimating];
		[alertView addSubview:loadingActivity];
    }
    return self;
	
}

-(void)makeDefaultAlertViewWithTitle:(NSString *)title andMessage:(NSString *)Message;
{
	backgroundView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
	backgroundView.clipsToBounds = YES;
	
	alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 230, 110)];
	alertView.center = backgroundView.center;
	alertView.backgroundColor = [UIColor whiteColor];
	UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:alertView.bounds];
	alertView.layer.masksToBounds = NO;
	alertView.layer.cornerRadius = 5;
	alertView.layer.shadowColor = [UIColor blackColor].CGColor;
	alertView.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
	alertView.layer.shadowOpacity = 0.3f;
	alertView.layer.shadowPath = shadowPath.CGPath;
	
	titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5,alertView.frame.size.width,20)];
	titleLabel.numberOfLines = 1;
	titleLabel.textAlignment = NSTextAlignmentCenter;
	titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:titleFontSize];
	titleLabel.text = title;
	
	messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,titleLabel.frame.size.height + 5,alertView.frame.size.width,40)];
	messageLabel.textAlignment = NSTextAlignmentCenter;
	messageLabel.numberOfLines = 3;
	messageLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:messageFontSize];
	messageLabel.text = Message;
	
	[alertView addSubview:titleLabel];
	[alertView addSubview:messageLabel];
	
}
- (void)show
{
	[backgroundView addSubview:alertView];
	[[[[UIApplication sharedApplication] delegate] window] addSubview:backgroundView];
}
@end
