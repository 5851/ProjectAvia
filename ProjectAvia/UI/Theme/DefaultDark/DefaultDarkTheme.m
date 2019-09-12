//
//  DefaultDarkTheme.m
//  ObjcLessons
//
//  Created by Stanislav Ivanov on 09/09/2019.
//  Copyright © 2019 Stanislav Ivanov. All rights reserved.
//

#import "DefaultDarkTheme.h"

@implementation DefaultDarkTheme

- (nonnull NSString*) identifier { return ThemeIdentifier_DefaultDark; }

- (nonnull UIColor*) backgroundColor     { return UIColor.blackColor; }
- (nonnull UIColor*) viewBackgroundColor { return UIColor.grayColor; }
- (nonnull UIColor*) activeColor         { return UIColor.redColor; }

- (nonnull UIColor*) textActionColor   { return UIColor.darkTextColor; }
- (nonnull UIColor*) textActiveColor   { return UIColor.darkTextColor; }
- (nonnull UIColor*) textInactiveColor { return UIColor.lightTextColor; }

- (CGFloat) actionCornerRadius  { return 10; }

- (CGFloat) horizontalEdgeInset {
    //return 50;
    if ([UIScreen mainScreen].bounds.size.width <= 320) {
        return 20;
    }
    
    return 50;
}

- (CGFloat) submitActionHeight { return 50; }

- (CGFloat) topInset { return 100; }

- (nonnull UIFont*) titleFont { return [UIFont systemFontOfSize: 15]; }

@end
