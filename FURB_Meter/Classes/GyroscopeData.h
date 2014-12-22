//
//  GyroscopeData.h
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 07/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface GyroscopeData : NSObject

@property (assign) void(*gyroscopeUpdate)(double, double, double);
-(void)startUpdates;

@end
