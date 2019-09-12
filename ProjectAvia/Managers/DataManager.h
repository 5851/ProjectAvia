#import <Foundation/Foundation.h>

#import "Country.h"
#import "City.h"
#import "Airport.h"


NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (nonatomic, strong, readonly) NSArray<Country*>* countries;
@property (nonatomic, strong, readonly) NSArray<City*>* cities;
@property (nonatomic, strong, readonly) NSArray<Airport*>* airports;

+ (DataManager*) shared;

- (NSNotificationName) didLoadCountriesNotificationName;
- (NSNotificationName) didLoadCitiesNotificationName;
- (NSNotificationName) didLoadAirportsNotificationName;

- (void) loadData;

@end

NS_ASSUME_NONNULL_END
