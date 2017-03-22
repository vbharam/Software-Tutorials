//
//  Video.h
//  CodecoopTutorial
//
//  Created by Vishal Bharam on 3/21/17.
//  Copyright © 2017 Codecoop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (nonatomic,strong) NSString *videoTitle;
@property (nonatomic,strong) NSString *videoDescription;
@property (nonatomic,strong) NSString *videoIframe;
@property (nonatomic,strong) NSString *thumbnailUrl;

@end
