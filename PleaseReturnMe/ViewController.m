//
//  ViewController.m
//  PleaseReturnMe
//
//  Created by David Kapp on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize nameLabel;
@synthesize emailLabel;
@synthesize phoneLabel;
@synthesize picture;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self setValuesFromPreferences];
}

- (void)viewDidUnload
{
  [self setNameLabel:nil];
  [self setEmailLabel:nil];
  [self setPhoneLabel:nil];
  [self setPicture:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (void)setValuesFromPreferences {
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  
  NSDictionary *initialSettings = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   @"halp", kPicture,
                                   @"Your Name", kName,
                                   @"youremail@yourdomain.com", kEmail,
                                   @"555-555-5555", kPhone,                                  
                                   nil];
  [userDefaults registerDefaults:initialSettings];
  
  NSString *picturePreference = [userDefaults stringForKey:kPicture];
  self.picture.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", picturePreference, @".png"]];
  
  self.nameLabel.text = [userDefaults stringForKey:kName];
  self.emailLabel.text = [userDefaults stringForKey:kEmail];
  self.phoneLabel.text = [userDefaults stringForKey:kPhone];
}

@end
