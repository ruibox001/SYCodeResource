//
//  STKFinancialCellOlderView.h
//  Tronker
//
//  Created by 王声远 on 17/3/6.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STKCategeryBtnView : UIView

- (instancetype)initWithMaxW:(CGFloat)width datas:(NSArray *)models;
- (CGFloat)getHeight;

@end
