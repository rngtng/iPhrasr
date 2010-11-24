//
//  Saying.m
//  iPhrasr
//
//  Created by Tobias Bielohlawek on 22.11.10.
//  Copyright 2010 SoundCloud. All rights reserved.
//

#import "Saying.h"
#import "NSString+SBJSON.h"

@interface Saying ()

+ (NSDictionary *)randomSayingInfoByAPIRequest;

+ (NSDictionary *)JSONValueByAPIRequestWithURLString:(NSString *)urlString;

@end

@implementation Saying

@synthesize leftSentence = _leftSentence;
@synthesize rightSentence = _rightSentence;

/* Grundgerüst:
 
- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

 to_s:   (wird bei @"%@" in printf statements aufgerufen)
 
 - (NSString *)description
 {
 }

 */




/* Methode mit mehr als einem Parameter:

 + (NSURLRequest *) requestWithURL:(NSURL)*url port:(NSUInteger)port
 {
 ...
 }

*/

- (id)init
{
    if (self = [super init])
    {
    }
    return self;
}

- (void)randomizeFromOnlineDatabase
{
    NSDictionary *sentenceInfo = [[self class] randomSayingInfoByAPIRequest];

    self.leftSentence  = [sentenceInfo valueForKey:kLeftSentenceIdKey];
    self.rightSentence = [sentenceInfo valueForKey:kRightSentenceIdKey];
}

+ (NSDictionary *)randomSayingInfoByAPIRequest
{
    NSString *urlString = [NSString stringWithFormat:@"%@/sayings.json", kApiEndPoint];
    
    // URLWithString : Convenience method, die ein autoreleasetes Objekt liefert:
    /*
     + (NSURL *)URLWithString:(NSString *)string
     {
     return [[[NSURL alloc] initWithString:string] autorelease];
     }
     */
    // [object method];
    // dot-syntax *nur* für getter/setter-paare aus properties
    
    NSDictionary *response = [[self class] JSONValueByAPIRequestWithURLString:urlString];

    NSString *leftSentenceText = [response valueForKeyPath:@"saying.left_sentence.text"];
    NSString *rightSentenceText = [response valueForKeyPath:@"saying.right_sentence.text"];
    
    return [NSDictionary dictionaryWithObjectsAndKeys:
            leftSentenceText, kLeftSentenceIdKey,
            rightSentenceText, kRightSentenceIdKey,
            nil];
}

+ (NSDictionary *)JSONValueByAPIRequestWithURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];

    NSString *jsonString = [NSString stringWithContentsOfURL:url 
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    
    return [jsonString JSONValue];
}

- (void)dealloc
{
    [_leftSentence release];
    [_rightSentence release];

    [super dealloc];
}

@end
