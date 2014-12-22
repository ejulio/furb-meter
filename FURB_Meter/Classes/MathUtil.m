//
//  MathUtil.m
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 17/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import "MathUtil.h"

@implementation MathUtil

+(double)convertToDegrees:(double)radians {
    return radians * (180 / M_PI);
}

+(double)convertToRadians:(double)degrees {
    return degrees * (M_PI / 180);
}


@end
