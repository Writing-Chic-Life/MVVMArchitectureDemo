//
//  UIViewController+PrivacyAlert.m
//  SISSAPP
//
//  Created by 袁应荣 on 2017/11/2.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIViewController+PrivacyAlert.h"
#import <CoreLocation/CLLocationManager.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@implementation UIViewController (PrivacyAlert)

#pragma mark 相机权限
- (void)cameraPrivilege {
    
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted) { // 用户还没有处理权限请求
        
        NSLog(@"Restricted");
    } else if(authStatus == AVAuthorizationStatusDenied) { // 用户已拒绝权限请求
        
        [self goToSettingPrivilegeWithTipMessage:@"相机权限已被禁用，基础功能暂无法使用，是否去开启？"];
        return;
    } else if(authStatus == AVAuthorizationStatusAuthorized) { // 允许权限请求
        
    } else if(authStatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
            if(granted) { // 用户点击允许权限请求
                
            } else { // 用户点击拒绝权限请求
                [self goToSettingPrivilegeWithTipMessage:@"相机权限已被禁用，基础功能暂无法使用，是否去开启？"];
            }
        }];
    } else {
        // 未知的权限状态
    }
}

#pragma mark 相册权限
- (void)albumPrivilege {
    
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if(authStatus == PHAuthorizationStatusNotDetermined) { // 用户还没有处理权限请求
        
        NSLog(@"Restricted");
    } else if(authStatus == PHAuthorizationStatusDenied) { // 用户拒绝当前应用访问相册,我们需要提醒用户打开访问开关
        
        [self goToSettingPrivilegeWithTipMessage:@"相册权限已被禁用，基础功能暂无法使用，是否去开启？"];
        return;
    } else if(authStatus == PHAuthorizationStatusAuthorized) { // 家长控制,不允许访
        
    } else if(authStatus == PHAuthorizationStatusRestricted) { // 用户允许当前应用访问相册
        
    } else {
        // 未知的权限状态
    }
}

#pragma mark 提示用户去系统设置修改权限
- (void)goToSettingPrivilegeWithTipMessage:(NSString *)message {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"去开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if([[UIApplication sharedApplication] canOpenURL:settingsURL]) {
                [[UIApplication sharedApplication] openURL:settingsURL];
            }
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"暂不开启" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:confirm];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}


#pragma mark 定位权限
- (void)locationPrivilege {
    
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) { // 用户还没有处理权限请求
        
        NSLog(@"Restricted");
    } else if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) { // 定位不能用
        
        [self goToSettingLocationPrivilege];
        return;
    } else if([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)) { // 定位功能可用
        
    } else {
        // 未知的权限状态
    }
}

#pragma mark 提示用户去系统设置修改相机权限
- (void)goToSettingLocationPrivilege {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"定位权限已被禁用，基础功能暂无法使用，是否去开启？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"去开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (YYR_iOS8_VERSTION_LATER) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            } else {
                NSURL *privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=LOCATIONS"];
                if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                    [[UIApplication sharedApplication] openURL:privacyUrl];
                } else {
                    
                }
            }

        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"暂不开启" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:confirm];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}


/**
 提示用户设置隐私权限

 @param privacyStr 相关权限
 */
- (void)tipPrivacySettingWithPrivacyStr:(NSString *)privacyStr {
    
    NSString *appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
    if (!appName) appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
    NSString *message = [NSString stringWithFormat:@"请在iPhone的\"设置-隐私-%@\"选项中，\r允许%@访问你的%@",privacyStr,appName,privacyStr];
    
    UIAlertController *alertContr = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertContr addAction:confirm];
    [self presentViewController:alertContr animated:YES completion:nil];
}

@end
