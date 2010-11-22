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

+ (NSString *)sentenceByAPIRequestWithId:(NSNumber *)sentenceId;
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

    self.leftSentence = [[self class] sentenceByAPIRequestWithId:[sentenceInfo
                                                                  valueForKey:kLeftSentenceIdKey]];
    self.rightSentence = [[self class] sentenceByAPIRequestWithId:[sentenceInfo
                                                                   valueForKey:kRightSentenceIdKey]];
}

+ (NSString *)sentenceByAPIRequestWithId:(NSNumber *)sentenceId
{
    NSString *urlString = [NSString stringWithFormat:@"http://0.0.0.0:3000/sentences/%@.json", sentenceId];
    NSDictionary *response = [[self class] JSONValueByAPIRequestWithURLString:urlString];

    NSDictionary *sentenceDescription = [[response allValues] objectAtIndex:0];
    return [sentenceDescription valueForKey:@"text"];
}

+ (NSDictionary *)randomSayingInfoByAPIRequest
{
    NSString *urlString = @"http://0.0.0.0:3000/sayings.json";
    
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

    NSNumber *leftSentenceId = [response valueForKeyPath:@"saying.left_sentence_id"];
    NSNumber *rightSentenceId = [response valueForKeyPath:@"saying.right_sentence_id"];
    
    return [NSDictionary dictionaryWithObjectsAndKeys:
            leftSentenceId, kLeftSentenceIdKey,
            rightSentenceId, kRightSentenceIdKey,
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
