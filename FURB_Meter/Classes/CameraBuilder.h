//
//  CameraBuilder.h
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 03/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CameraBuilder : NSObject

@property (readonly) UIImagePickerController* imagePicker;

-(void)createUiImagePickerController;
-(void)addOverlay;
-(void)addItemToOverlay:(UIView*)item;

@end
