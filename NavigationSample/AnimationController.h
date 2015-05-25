#import <Foundation/Foundation.h>

@interface AnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isReverse;
@property (nonatomic, assign) NSTimeInterval duration;

@end
