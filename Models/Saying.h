//
//  Saying.h
//  iPhrasr
//
//  Created by Tobias Bielohlawek on 22.11.10.
//  Copyright 2010 SoundCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLeftSentenceIdKey      @"leftSentenceId"
#define kRightSentenceIdKey     @"rightSentenceId"

@interface Saying : NSObject
{
    NSString *_leftSentence;
    NSString *_rightSentence;
}

@property (nonatomic, copy) NSString *leftSentence;
@property (nonatomic, copy) NSString *rightSentence;

- (void)randomizeFromOnlineDatabase;

@end
