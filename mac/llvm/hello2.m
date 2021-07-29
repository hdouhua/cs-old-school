#import <Foundation/Foundation.h>

// #import "hello2.h"
// warning: class 'World' defined without specifying a base class [-Wobjc-root-class]
// to fix: the class should inherit from NSObject
@interface World: NSObject
- (void)hello;
@end


@implementation World
- (void)hello {
  NSLog(@"hello, world!");
}
@end


int main() {
  World* world = [World new];
  [world hello];
}