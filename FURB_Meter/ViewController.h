//
//  ViewController.h
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 31/10/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraBuilder.h"
#import "LabelLineBuilder.h"
#import "GyroscopeData.h"
#import "ObjectDimensionsCalculator.h"
#import "MathUtil.h"

@interface ViewController : UIViewController

- (IBAction)measureButtonTouchUpInside:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *heightField;

@end

