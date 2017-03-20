//
//  ViewController.m
//  CodecoopTutorial
//
//  Created by Vishal Bharam on 3/18/17.
//  Copyright © 2017 Codecoop. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HTTPService instance] getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
        if (dataDict) {
            NSLog(@"Dict Data - %@", dataDict.debugDescription);
        } else if (errMessage) {
            // Display Error:
            
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
