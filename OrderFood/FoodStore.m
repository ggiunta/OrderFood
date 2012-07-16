//
//  FoodStore.m
//  OrderFood
//
//  Created by German Giunta on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FoodStore.h"

@implementation FoodStore

@synthesize category = _category;
@synthesize name = _name;
@synthesize area = _area;
@synthesize phone = _phone;
@synthesize prices = _prices;
@synthesize url_menu = _url_menu;
@synthesize logoFileName = _logoFileName;
@synthesize lat = _lat;
@synthesize lon = _lon;

-(id)initWithCategory:(NSString*)category name:(NSString*)name area:(NSString*)area phone:(NSString*)phone prices:(NSString*)prices url_menu:(NSString *)url_menu logoFileName:(NSString*)logoFileName lat:(NSString*)lat lon:(NSString*)lon
{
    if ((self = [super init])) {
        self.category = category;
        self.name = name;
        self.area = area;
        self.phone = phone;
        self.prices = prices;
        self.url_menu = url_menu;
        self.logoFileName = logoFileName;
        self.lat = lat;
        self.lon = lon;
    }
    return self;
}

@end
