#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define ThemeIdentifier_DefaultLight @"DefaultLightTheme"
#define ThemeIdentifier_DefaultDark  @"DefaultDarkTheme"


NS_ASSUME_NONNULL_BEGIN

@interface BaseTheme : NSObject

- (nonnull NSString*) identifier;

- (nonnull UIColor*) backgroundColor;
- (nonnull UIColor*) viewBackgroundColor;
- (nonnull UIColor*) activeColor;

- (nonnull UIColor*) textActionColor;
- (nonnull UIColor*) textActiveColor;
- (nonnull UIColor*) textInactiveColor;

- (CGFloat) actionCornerRadius;

- (CGFloat) horizontalEdgeInset;

- (CGFloat) submitActionHeight;

- (CGFloat) topInset;


- (nonnull UIFont*) titleFont;


@end

NS_ASSUME_NONNULL_END
