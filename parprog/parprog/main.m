//
//  main.m
//  parprog
//
//  Created by Artem Lomov on 15/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyModel.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        MyModel *rmodel = [MyModel new];
        dispatch_apply(25, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(size_t size){
            if(size % 10 == 0)
            {
                [rmodel setRcount:[rmodel getRcount]+1];
            }
            NSLog(@"%lu", [rmodel getRcount]);
        });
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

