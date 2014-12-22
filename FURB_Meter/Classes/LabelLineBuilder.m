//
//  LabelLineBuilder.m
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 03/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import "LabelLineBuilder.h"

@implementation LabelLineBuilder

const int TAMANHO_FONTE = 22;
const int ALTURA_LABEL = 23;

int totalX;
int totalY;

-(void)createLabelsLine:(int)x y:(int)y {
    totalX = x;
    totalY = y;
}

-(UILabel*)createLabel:(NSString *)texto width:(int)width {
    UILabel* label =[[UILabel alloc]initWithFrame:CGRectMake(totalX, totalY, width, ALTURA_LABEL)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:TAMANHO_FONTE];
    label.textColor = [UIColor whiteColor];
    label.text = texto;
    totalX += width;
    return label;
}

@end
