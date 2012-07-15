//
//  DetailViewController.h
//  OrderFood
//
//  Created by German Giunta on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodStore.h"

@interface DetailViewController : UIViewController


@property (strong, nonatomic) FoodStore *detailItem;
@property (strong, nonatomic) IBOutlet UILabel *storeName;
@property (weak, nonatomic) IBOutlet UILabel *storeCategory;
@property (weak, nonatomic) IBOutlet UILabel *storeArea;
@property (weak, nonatomic) IBOutlet UILabel *storePrices;
@property (weak, nonatomic) IBOutlet UILabel *storePhone;
@property (weak, nonatomic) IBOutlet UIImageView *foodStoreLogo;
@property (weak, nonatomic) IBOutlet UIImageView *callStoreLogo;


- (IBAction)goToWebMenu:(id)sender;
- (IBAction)callStore:(id)sender;


@end
