//
//  SegmentedControl.m
//  ObjcLessons
//
//  Created by Stanislav Ivanov on 09/09/2019.
//  Copyright © 2019 Stanislav Ivanov. All rights reserved.
//

#import "SegmentedControl.h"
#import "ThemeManager.h"


@interface SegmentedControl ()

@property (nonatomic, weak) ThemeManager* themeManager;

@end


@implementation SegmentedControl

- (instancetype)init {
    self = [super init];
    if (self) {
        self.themeManager = [ThemeManager shared];
        [self addNotifications];
        [self updateTheme];
    }
    return self;
}

- (void)dealloc {
    [self removeNotifications];
}

#pragma mark - Theme

- (void) updateTheme {
    BaseTheme* activeTheme = [self.themeManager activeTheme];
    
    self.backgroundColor = [activeTheme viewBackgroundColor];
    
    UIColor* activeColor = [activeTheme activeColor];
    self.tintColor = activeColor;
    
    self.layer.cornerRadius = [activeTheme actionCornerRadius];
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.masksToBounds = YES;
}

#pragma mark - Notifications

- (void) addNotifications {
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didReceiveChangedThemeNotification)
                                                 name: [self.themeManager didChangedThemeNotificationName]
                                               object: nil];
}

- (void) removeNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [self.themeManager didChangedThemeNotificationName]
                                                  object: nil];
}

- (void) didReceiveChangedThemeNotification {
    [self updateTheme];
}

@end
