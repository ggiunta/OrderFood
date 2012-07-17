//
//  DetailViewController.m
//  OrderFood
//
//  Created by German Giunta on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "FoodStore.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize storeName = _storeName;
@synthesize storeCategory = _storeCategory;
@synthesize storeArea = _storeArea;
@synthesize storePrices = _storePrices;
@synthesize storePhone = _storePhone;
@synthesize foodStoreLogo = _foodStoreLogo;
@synthesize callStoreLogoRight = _callStoreLogoRight;
@synthesize callStoreLogoLeft = _callStoreLogoLeft;
@synthesize fileBackground = _fileBackground;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.storeName.text = self.detailItem.name;
        self.storeCategory.text = [NSString stringWithFormat: @"Category: %@", self.detailItem.category];
        self.storeArea.text = [NSString stringWithFormat: @"Area: %@", self.detailItem.area];
        self.storePrices.text = [NSString stringWithFormat: @"Prices: %@", self.detailItem.prices];
        [self.storePhone setTitle:self.detailItem.phone forState:UIControlStateNormal];
        self.callStoreLogoRight.image = [UIImage imageNamed:@"callGenericHd.png"];
        self.callStoreLogoLeft.image = [UIImage imageNamed:@"callGenericHd.png"];
        self.fileBackground.image = [UIImage imageNamed:@"File3.png"];
        self.foodStoreLogo.image = [UIImage imageNamed:self.detailItem.logoFileName];
        if (!self.foodStoreLogo.image) {
            self.foodStoreLogo.image = [UIImage imageNamed:@"foodGenericHd.png"];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"metal.jpg"]]];
    self.title = self.detailItem.name;
}

- (void)viewDidUnload
{
    [self setStoreName:nil];
    [self setStoreCategory:nil];
    [self setStoreArea:nil];
    [self setStorePrices:nil];
    [self setStorePhone:nil];
    [self setFoodStoreLogo:nil];
    [self setCallStoreLogoRight:nil];
    [self setCallStoreLogoLeft:nil];
    [self setFileBackground:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)goToWebMenu:(id)sender {
    NSString* launchUrl = self.detailItem.url_menu;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:launchUrl]];
}


- (IBAction)callStore:(id)sender {
    NSString *phone = [NSString stringWithFormat: @"tel://%@", self.detailItem.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailController = segue.destinationViewController;
    detailController.detailItem = self.detailItem;
}

@end
