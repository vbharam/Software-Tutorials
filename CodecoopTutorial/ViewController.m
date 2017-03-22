//
//  ViewController.m
//  CodecoopTutorial
//
//  Created by Vishal Bharam on 3/18/17.
//  Copyright © 2017 Codecoop. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *videoList;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataDict, NSString * _Nullable errMessage) {
        if (dataDict) {
            NSMutableArray *videoArray = [[NSMutableArray alloc]init];
            
            for (NSDictionary *dict in videoArray) {
                Video *vid = [[Video alloc]init];
                vid.videoTitle = [dict objectForKey:@"title"];
                vid.videoDescription = [dict objectForKey:@"description"];
                vid.thumbnailUrl = [dict objectForKey:@"thumbnail"];
                vid.videoIframe = [dict objectForKey:@"iframe"];
                
                [videoArray addObject:vid];
            }
            
            self.videoList = videoArray;
            [self updateTableData];
            
        } else if (errMessage) {
            // Display Error:
            
        }
    }];
}


-(void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if (!cell) {
        cell = [[VideoCell alloc]init];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell*)cell;
    [vidCell updateUI:video];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
