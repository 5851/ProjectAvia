#import "TitleLabel.h"
#import "ThemeManager.h"


@interface TitleLabel ()

@property (nonatomic, weak) ThemeManager* themeManager;

@end


@implementation TitleLabel

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

    UIColor* activeColor = [activeTheme activeColor];
    self.textColor = activeColor;
    
    self.font = [activeTheme titleFont];
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
