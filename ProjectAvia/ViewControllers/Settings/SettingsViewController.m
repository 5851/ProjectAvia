#import "SettingsViewController.h"
#import "SegmentedControl.h"
#import "TitleLabel.h"
#import "ViewBackground.h"


@interface SettingsViewController ()

@property (nonatomic, weak) SegmentedControl* themasSegmentedControl;
@property (nonatomic, weak) TitleLabel* titleLabel;
@property (nonatomic, weak) ViewBackground* viewBackground;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    [self addSubviews];
    [self getTextField];
    [self getTextView];
    [self getSlider];
    [self getProgressView];
    [self getImageView];
}

#pragma mark - Layout

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    BaseTheme* activeTheme = [self.themeManager activeTheme];
    CGFloat horizontalEdgeInset = [activeTheme horizontalEdgeInset];
    CGFloat width = self.view.frame.size.width - horizontalEdgeInset * 2;
    CGFloat height = [activeTheme submitActionHeight];
    CGFloat y = (self.view.frame.size.height - height) / 2;
    
    self.themasSegmentedControl.frame = CGRectMake(horizontalEdgeInset, y, width, height);
    
    CGFloat titleLabelY = [activeTheme topInset];
    self.titleLabel.frame = CGRectMake(horizontalEdgeInset,
                                       titleLabelY,
                                       width,
                                       height);
}

#pragma mark - Theme

- (void) updateTheme {
    [super updateTheme];
}

#pragma mark - Subviews

- (void) addSubviews {
    [self addThemasSegmentedControl];
    [self addTitleLabel];
}

- (void) addTitleLabel {
    if (nil != self.titleLabel) { return; }
    
    TitleLabel* titleLabel = [TitleLabel new];
    [self.view addSubview: titleLabel];
    self.titleLabel = titleLabel;
    
    titleLabel.text = @"Settings";
}

- (void) addView {
    if (nil != self.viewBackground) { return; }
    
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    ViewBackground *viewBackground = [[ViewBackground alloc] initWithFrame: frame];
    [self.view addSubview: viewBackground];
    self.viewBackground = viewBackground;
}

- (void) addThemasSegmentedControl {
    if (nil != self.themasSegmentedControl) { return; }
    
    SegmentedControl* themasSegmentedControl = [SegmentedControl new];
    [self.view addSubview: themasSegmentedControl];
    self.themasSegmentedControl = themasSegmentedControl;
    
    [themasSegmentedControl addTarget: self
                               action: @selector(themasSegmentedControlAction)
                     forControlEvents: UIControlEventValueChanged];
    
    NSArray* avaliableThemas = [self.themeManager avaliableThemas];
    NSString* activeThemeIdentifier = [[self.themeManager activeTheme] identifier];
    NSUInteger index = 0;
    for (BaseTheme* theme in avaliableThemas) {
        NSString* identifier = [theme identifier];
        [themasSegmentedControl insertSegmentWithTitle: identifier
                                               atIndex: index
                                              animated: NO];
        if ([identifier isEqualToString: activeThemeIdentifier]) {
            themasSegmentedControl.selectedSegmentIndex = index;
        }
        
        index++;
    }
}

#pragma mark - Actions

- (void) themasSegmentedControlAction {
    NSUInteger selectedIndex = [self.themasSegmentedControl selectedSegmentIndex];
    
    NSArray* avaliableThemas = [self.themeManager avaliableThemas];
    for (NSUInteger i = 0; i < [avaliableThemas count]; i++) {
        if (i != selectedIndex) { continue; }
        
        BaseTheme* newTheme = [avaliableThemas objectAtIndex: i];
        [self.themeManager selectThemeWith: [newTheme identifier]];
    }
}

-(void)getTextField {
    
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100, 80, 200, 40);
    UITextField *textField = [[UITextField alloc] initWithFrame: frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField.layer setCornerRadius: 5];
    textField.tintColor = [UIColor blackColor];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"Введите значение...";
    textField.font = [UIFont systemFontOfSize: 14 weight: UIFontWeightLight];
    [self.view addSubview: textField];
}

-(void)getTextView {
    
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, 140, 200.0, 50.0);
    UITextView *textView = [[UITextView alloc] initWithFrame: frame];
    textView.backgroundColor = [UIColor whiteColor];
    textView.textColor = [UIColor blackColor];
    textView.layer.cornerRadius = 5;
    textView.text = @"Hello, World!";
    [self.view addSubview:textView];
}

-(void)getSlider {
    
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, 240, 200.0, 50.0);
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = frame;
    slider.tintColor = [UIColor blackColor];
    slider.value = 0.5;
    [self.view addSubview:slider];
}

-(void)getProgressView {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, 330, 200.0, 50.0);
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
    progressView.progressTintColor = [UIColor blackColor];
    progressView.frame = frame;
    progressView.progress = 0.5;
    [self.view addSubview:progressView];
}

-(void)getImageView {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, [UIScreen mainScreen].bounds.size.height/2 + 100, 200.0, 150.0);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: frame];
    imageView.image = [UIImage imageNamed:@"nature"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:imageView];
}

@end
