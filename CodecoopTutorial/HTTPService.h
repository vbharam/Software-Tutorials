//
//  HTTPService.h
//  CodecoopTutorial
//
//  Created by Vishal Bharam on 3/18/17.
//  Copyright © 2017 Codecoop. All rights reserved.
//

#import <Foundation/Foundation.h>

// Singleton: is an object that is instantiated once and lives in the memory for most of the time for the lifetime of the application. Instead of a regular class where you instantiate multiple objects: [Person class], here you have only once instantiation and it uses in some kind of singleton fashion

// Whenever creating a singleton in Obj-C, create a static function:
// Static fucntion: its a only one of it. "+" sign means its static and you can call it globally on the class, without having to had created first instance of that class.

// Block Syntax:
typedef void(^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+(id) instance;
-(void) getTutorials: (nullable onComplete)completionHandler;

@end
