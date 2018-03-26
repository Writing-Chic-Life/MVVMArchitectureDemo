//
//  NSError+YYRModelException.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (YYRModelException)

// Creates a new error for an exception that occured during updating an
// MTLModel.
//
// exception - The exception that was thrown while updating the model.
//             This argument must not be nil.
//
// Returns an error that takes its localized description and failure reason
// from the exception.
+ (instancetype)yyr_modelErrorWithException:(NSException *)exception;

@end
