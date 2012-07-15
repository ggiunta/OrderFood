//
//  FoodStore.h
//  OrderFood
//
//  Created by German Giunta on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodStore : NSObject

@property (strong) NSString *category;
@property (strong) NSString *name;
@property (strong) NSString *area;
@property (strong) NSString *phone;
@property (strong) NSString *prices;
@property (strong) NSString *url_menu;

-(id)initWithCategory:(NSString*)category name:(NSString*)name area:(NSString*)area phone:(NSString*)phone prices:(NSString*)prices url_menu:(NSString *)url_menu;

@end
