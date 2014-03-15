//
//  APAlertview.h
//  APAlertViewSampleProject
//
//  Created by Ali Pourhadi on 3/13/14.
//  Copyright (c) 2014 AliPourhadi. All rights reserved.
//

@protocol APAlertviewDelegate <NSObject>



@end


#import <UIKit/UIKit.h>

@interface APAlertview : UIView

-(id)initLoadingAlertViewWithTitle:(NSString *)alertTitle message:(NSString *)message delegate:(id)delegate loadingColor:(UIColor *)loadingColor;
- (void)show;

@end
