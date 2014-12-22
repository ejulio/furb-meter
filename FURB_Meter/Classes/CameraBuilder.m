//
//  CameraBuilder.m
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 03/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import "CameraBuilder.h"

@implementation CameraBuilder

@synthesize imagePicker;
UIView* overlayView;

-(void)createUiImagePickerController {
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
    imagePicker.allowsEditing = NO;
    imagePicker.showsCameraControls = NO;
}

-(void)addOverlay {
    overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    overlayView.opaque = NO;
    overlayView.backgroundColor = [UIColor clearColor];
    imagePicker.cameraOverlayView = overlayView;
}

-(void)addItemToOverlay:(UIView*)item {
    [overlayView addSubview:item];
}

@end

