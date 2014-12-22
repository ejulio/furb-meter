//
//  ViewController.m
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 31/10/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

const int LABEL_HEIGHT = 25;
const int BUTTON_HEIGHT = 50;

GyroscopeData* gyroscopeData;
CameraBuilder* cameraBuilder;
ObjectDimensionsCalculator* dimensionsCalculator;
UILabel* labelHeight;
UILabel* labelDegrees;
UILabel* labelDistance;

double deviceRoll = 0;
double userHeight = 0;
double objectDistance = 0;
double objectHeight = 0;
int topDistance = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dimensionsCalculator = [[ObjectDimensionsCalculator alloc] init];
    cameraBuilder = [[CameraBuilder alloc] init];
    gyroscopeData = [[GyroscopeData alloc] init];
    gyroscopeData.gyroscopeUpdate = &gyroscopeUpdateCallback;
}

void gyroscopeUpdateCallback(double roll, double yaw, double pitch) {
    deviceRoll = roll;
    if (labelDegrees)
    {
        labelDegrees.text = [NSString stringWithFormat:@" %.3lf", [MathUtil convertToDegrees:deviceRoll]];
    }
    
    if (objectDistance > 0.0f && labelHeight)
    {
        objectHeight = [dimensionsCalculator calculateHeight:objectDistance radians:deviceRoll baseHeight:userHeight];
        objectHeight = fabs(objectHeight);
        labelHeight.text = [NSString stringWithFormat:@" %.3lf", objectHeight];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)measureButtonTouchUpInside:(id)sender {
    userHeight = [[[self heightField] text] doubleValue];
    [cameraBuilder createUiImagePickerController];
    [cameraBuilder addOverlay];
    
    [self addLabelsToCameraOverlay];
    [self addButtonsToCameraOverlay];
    [self addLineToCameraOverlay];
    
    [self presentViewController:[cameraBuilder imagePicker] animated:YES completion:nil];
    [gyroscopeData startUpdates];
}

-(void)onCalculateDistanceTouch {
    objectDistance = [dimensionsCalculator calculateDistance:userHeight radians:deviceRoll];
    objectDistance = fabs(objectDistance);
    labelDistance.text = [NSString stringWithFormat:@" %.3lf", objectDistance];
}

-(void)addButtonsToCameraOverlay {
    topDistance += BUTTON_HEIGHT;
    UIButton* buttonDistance = [[UIButton alloc] initWithFrame:CGRectMake(25, topDistance, 150, 23)];
    [buttonDistance setTitle:@"Calcular distância" forState:UIControlStateNormal];
    [buttonDistance addTarget:nil
        action:@selector(onCalculateDistanceTouch)
        forControlEvents:UIControlEventTouchUpInside];
    
    [cameraBuilder addItemToOverlay:buttonDistance];
}

-(void)addLabelsToCameraOverlay {
    LabelLineBuilder* labelLineBuilder = [[LabelLineBuilder alloc] init];
    
    topDistance += LABEL_HEIGHT;
    [labelLineBuilder createLabelsLine:25 y:topDistance];
    [cameraBuilder addItemToOverlay:[labelLineBuilder createLabel:@"Altura:" width:80]];
    labelHeight = [labelLineBuilder createLabel:@"0" width:100];
    [cameraBuilder addItemToOverlay:labelHeight];
    [cameraBuilder addItemToOverlay:[labelLineBuilder createLabel:@"cm" width:40]];
    
    topDistance += LABEL_HEIGHT;
    [labelLineBuilder createLabelsLine:25 y:topDistance];
    [cameraBuilder addItemToOverlay:[labelLineBuilder createLabel:@"Distância:" width:120]];
    labelDistance = [labelLineBuilder createLabel:@"0" width:100];
    [cameraBuilder addItemToOverlay:labelDistance];
    [cameraBuilder addItemToOverlay:[labelLineBuilder createLabel:@"cm" width:40]];
    
    topDistance += LABEL_HEIGHT;
    [labelLineBuilder createLabelsLine:25 y:topDistance];
    [cameraBuilder addItemToOverlay:[labelLineBuilder createLabel:@"Inclinação:" width:120]];
    labelDegrees = [labelLineBuilder createLabel:@"0" width:100];
    [cameraBuilder addItemToOverlay:labelDegrees];
    [cameraBuilder addItemToOverlay:[labelLineBuilder createLabel:@"graus" width:80]];
}

-(void)addLineToCameraOverlay {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    float lineYPosition = (screenWidth / 2) + 30;
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, lineYPosition, screenHeight, 2)];
    line.backgroundColor = [UIColor whiteColor];
    [cameraBuilder addItemToOverlay:line];
    
}
@end
