//
//  LabelLineBuilder.h
//  FURB_Meter
//
//  Created by Laboratorio de Computacao Grafica e Entretenimento Digital on 03/11/14.
//  Copyright (c) 2014 Laboratorio de Computacao Grafica e Entretenimento Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UiKit/UiKit.h>

@interface LabelLineBuilder : NSObject

-(void)createLabelsLine:(int)x y:(int)y;
-(UILabel*)createLabel:(NSString*)texto width:(int)width;

@end

