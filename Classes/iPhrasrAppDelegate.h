//
//  iPhrasrAppDelegate.h
//  iPhrasr
//
//  Created by Tobias Bielohlawek on 22.11.10.
//  Copyright 2010 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SayingsController;

@interface iPhrasrAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    SayingsController *_sayingsController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

