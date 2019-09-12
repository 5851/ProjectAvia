#import "BaseViewController.h"


@interface BaseViewController ()

@property (nonatomic, weak, readwrite) ThemeManager* themeManager;

@end


@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.themeManager = [ThemeManager shared];
    
    [self addNotifications];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [self updateTheme];
}

- (void)dealloc {
    [self removeNotifications];
}

#pragma mark - Theme

- (void) updateTheme {
    BaseTheme* activeTheme = [self.themeManager activeTheme];
    
    UIColor* backgroundColor  = [activeTheme backgroundColor];
    self.view.backgroundColor = backgroundColor;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
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
