#import "AppDelegate.h"
#import "MainViewController.h"
#import "RootNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    MainViewController* mainViewController = [[MainViewController alloc] init];
    
    RootNavigationController* rootNavigationController = [[RootNavigationController alloc] initWithRootViewController: mainViewController];
    
    self.window.rootViewController = rootNavigationController;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


@end
