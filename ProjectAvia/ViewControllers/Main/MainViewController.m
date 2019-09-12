#import "MainViewController.h"
#import "SettingsViewController.h"
#import "DataManager.h"


@interface MainViewController ()

@property (nonatomic, weak, readwrite) DataManager* dataManager;

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem* settingsButton = [[UIBarButtonItem alloc] initWithTitle: @"Settings"
                                                                       style: UIBarButtonItemStyleDone
                                                                      target: self
                                                                      action: @selector(openSettings)];
    
    self.navigationItem.rightBarButtonItem = settingsButton;
    
    self.dataManager = [DataManager shared];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [self.dataManager loadData];
}

#pragma mark - Actions

- (void) openSettings {
    SettingsViewController* settingsViewController = [SettingsViewController new];
    [self.navigationController pushViewController: settingsViewController animated: YES];
}

#pragma mark - Notifications

- (void) addNotifications {
    [super addNotifications];
    
    NSLog(@"MainViewController addNotifications");
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didReceiveCountries)
                                                 name: [self.dataManager didLoadCountriesNotificationName]
                                               object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didReceiveCities)
                                                 name: [self.dataManager didLoadCitiesNotificationName]
                                               object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(didReceiveAirports)
                                                 name: [self.dataManager didLoadAirportsNotificationName]
                                               object: nil];
}

- (void) removeNotifications {
    [super removeNotifications];
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [self.dataManager didLoadCountriesNotificationName]
                                                  object: nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [self.dataManager didLoadCitiesNotificationName]
                                                  object: nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: [self.dataManager didLoadAirportsNotificationName]
                                                  object: nil];
}

- (void) didReceiveCountries {
    //NSLog(@"%@", [NSThread callStackSymbols]);
    
    //NSLog(@"didReceiveCountries %@", self.dataManager.countries);
}

- (void) didReceiveCities {
    //NSLog(@"%@", [NSThread callStackSymbols]);
    
    //NSLog(@"didReceiveCities %@", self.dataManager.cities);
}

- (void) didReceiveAirports {
    NSLog(@"%@", [NSThread callStackSymbols]);
    
    NSLog(@"didReceiveAirports %@", self.dataManager.airports);
}


@end
