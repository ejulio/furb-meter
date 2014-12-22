//
//  ObjectDimensionsCalculator.h
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 10/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MathUtil.h"

@interface ObjectDimensionsCalculator : NSObject

-(double)calculateDistance:(double)height radians:(double)radians;
-(double)calculateHeight:(double)distance radians:(double)radians baseHeight:(double)baseHeight;


@end
