//
//  ObjectDimensionsCalculator.m
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 10/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import "ObjectDimensionsCalculator.h"

@implementation ObjectDimensionsCalculator

-(double)calculateDistance:(double)height radians:(double)radians {
    return height * tan(radians);
}

-(double)calculateHeight:(double)distance radians:(double)radians baseHeight:(double)baseHeight {
    double radiansTangent = tan(radians - [MathUtil convertToRadians:90]);
    double height = distance * radiansTangent;
    return fabs(height) + baseHeight;
}

@end
