//
//  UIApplication-Permissions.h
//  UIApplication-Permissions Sample
//
//  Created by Jack Rostron on 12/01/2014.
//  Copyright (c) 2014 Rostron. All rights reserved.
//  https://github.com/JackRostron/UIApplication-Permissions
//   Category on UIApplication that adds permission helpers


#import <UIKit/UIKit.h>

@import CoreLocation;

typedef enum {
    kPermissionTypeBluetoothLE,
    kPermissionTypeCalendar,
    kPermissionTypeContacts,
    kPermissionTypeLocation,
    kPermissionTypeMicrophone,
    kPermissionTypeMotion,
    kPermissionTypePhotos,
    kPermissionTypeReminders,
} kPermissionType;

typedef enum {
    kPermissionAccessDenied, //User has rejected feature
    kPermissionAccessGranted, //User has accepted feature
    kPermissionAccessRestricted, //Blocked by parental controls or system settings
    kPermissionAccessUnknown, //Cannot be determined
    kPermissionAccessUnsupported, //Device doesn't support this - e.g Core Bluetooth
    kPermissionAccessMissingFramework, //Developer didn't import the required framework to the project
} kPermissionAccess;

@interface UIApplication (Permissions)

//Check permission of service. Cannot check microphone or motion without asking user for permission
-(kPermissionAccess)hasAccessToBluetoothLE;
-(kPermissionAccess)hasAccessToCalendar;
-(kPermissionAccess)hasAccessToContacts;
-(kPermissionAccess)hasAccessToLocation;
-(kPermissionAccess)hasAccessToPhotos;
-(kPermissionAccess)hasAccessToReminders;

//Request permission with callback
/**
*  请求访问日历
*
*  @param accessGranted 允许
*  @param accessDenied  拒绝
*/
-(void)requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问通讯录
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问麦克风
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问相册
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
/**
 *  请求访问提醒事项
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;

/**
 *  请求访问位置信息
 *
 *  @param accessGranted 允许
 *  @param accessDenied  拒绝
 */
-(void)requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;

/**
 *  检查运动状态
 *
 *  @param accessGranted 允许
 */
-(void)requestAccessToMotionWithSuccess:(void(^)())accessGranted;

//Needs investigating - unsure whether it can be implemented because of required delegate callbacks
//-(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted;

@end
