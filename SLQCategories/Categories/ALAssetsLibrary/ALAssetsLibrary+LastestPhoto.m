//
//  ALAssetsLibrary+LastestPhoto
//
//
//  Created by song on 2017/5/24.
//  Copyright © 2017年 xx. All rights reserved.
//

#define SystemVersion [[UIDevice currentDevice].systemVersion floatValue]

#import "ALAssetsLibrary+LastestPhoto.h"

#import <Photos/PHAsset.h>
#import <Photos/PHImageManager.h>
#import <Photos/PHFetchOptions.h>


@implementation ALAssetsLibrary(LatestPhoto)
/*
 #import <AssetsLibrary/AssetsLibrary.h>
 */
- (void)latestAsset:(void (^)(UIImage * _Nullable, NSError *_Nullable))block {
    if (SystemVersion < 8.0) {
        
        [self enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group) {
                [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                [group enumerateAssetsWithOptions:NSEnumerationReverse/*遍历方式,逆序*/ usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                    if (result) {
                        ALAssetRepresentation *repr = [result defaultRepresentation];
                        UIImage *img = [UIImage imageWithCGImage:[repr fullResolutionImage]];
                        *stop = YES;
                        if (block) {
                            block(img,nil);
                        }
                        *stop = YES;
                    }
                    
                }];
                *stop = YES;
            }
        } failureBlock:^(NSError *error) {
            if (error) {
                if (block) {
                    block(nil,error);
                }
            }
        }];
    }
}

/*
#import <Photos/PHAsset.h>
#import <Photos/PHImageManager.h>
#import <Photos/PHFetchOptions.h>
 */
- (void)latestPhoto:(void (^_Nullable)(UIImage * _Nullable))block  {
    
    if (SystemVersion >= 8.0) {
        
        PHFetchOptions *fetchOptions = [[PHFetchOptions alloc] init];
        fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
        
        PHImageRequestOptions * requestOptions = [[PHImageRequestOptions alloc] init];
        requestOptions.synchronous = YES;
        
        PHFetchResult<PHAsset*> * fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
        
        if (fetchResult.count > 0) {
            PHAsset *asset = [fetchResult objectAtIndex:0];
            PHImageManager * manager = [PHImageManager defaultManager];
            CGSize targetSize = CGSizeMake(asset.pixelWidth, asset.pixelHeight);
            [manager requestImageForAsset:asset
                               targetSize:targetSize
                              contentMode:PHImageContentModeAspectFit
                                  options:requestOptions
                            resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                                
                                if (result) {
                                    if(block) {
                                        block(result);
                                    }
                                }
                                
                            }];
        }
    }
}

@end
