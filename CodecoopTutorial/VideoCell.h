//
//  VideoCell.h
//  CodecoopTutorial
//
//  Created by Vishal Bharam on 3/20/17.
//  Copyright © 2017 Codecoop. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;


@interface VideoCell : UITableViewCell

-(void)updateUI:(nonnull Video*)video;

@end
