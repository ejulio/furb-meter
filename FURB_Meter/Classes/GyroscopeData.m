//
//  GyroscopeData.m
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 07/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import "GyroscopeData.h"

@implementation GyroscopeData

const float ATUALIZATION_INTERVAL = 0.01f;

CMMotionManager* motionManager;

@synthesize gyroscopeUpdate;

-(void)startUpdates {
    [self createMotionManagerInstance];
    
    [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                       withHandler:^(CMDeviceMotion *motion, NSError *error) {
                                           [self notifyGyroscopeData:motion];
                                       }];
}

-(void)createMotionManagerInstance {
    if (motionManager == nil) {
        motionManager = [[CMMotionManager alloc] init];
        motionManager.accelerometerUpdateInterval = ATUALIZATION_INTERVAL;
        motionManager.gyroUpdateInterval = ATUALIZATION_INTERVAL;
        motionManager.deviceMotionUpdateInterval = ATUALIZATION_INTERVAL;
    }
}

-(void)notifyGyroscopeData:(CMDeviceMotion*)motion {
    double roll = motion.attitude.roll;
    double pitch = motion.attitude.pitch;
    double yaw = motion.attitude.yaw;
    gyroscopeUpdate(roll, yaw, pitch);
}

@end
