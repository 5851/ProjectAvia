#import <UIKit/UIKit.h>
#import "ThemeManager.h"


NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, weak, readonly) ThemeManager* themeManager;

- (void) updateTheme;

- (void) addNotifications;
- (void) removeNotifications;

@end

NS_ASSUME_NONNULL_END
