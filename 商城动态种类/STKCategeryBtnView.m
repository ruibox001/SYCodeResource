//
//  STKFinancialCellOlderView.m
//  Tronker
//
//  Created by 王声远 on 17/3/6.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#define btnTitleHeight 25
#define btnTitleFontSize 13

#define btnHeightMargen 10
#define btnWidthMargen 10

#define viewTopMargen 10
#define viewBottonMargen 10

#import "STKCategeryBtnView.h"

@interface STKCategeryBtnView()

@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,assign) CGFloat height;

@end

@implementation STKCategeryBtnView

- (instancetype)initWithMaxW:(CGFloat)width datas:(NSArray *)models
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor orangeColor];
        
        CGFloat y = viewTopMargen;
        CGFloat x = btnWidthMargen;
        
        for (int i = 0; i < models.count; i ++) {
            NSString *name = models[i];
            CGFloat w = [self getBtnWidthWithName:name];
            if (w > width) {
                w = width;
            }
            
            UIButton *btn = [self getBtnWithName:name tag:i];
            [self.btns addObject:btn];
            
            if ((x+w+btnWidthMargen) > width) {
                x = btnWidthMargen;
                y = y + btnTitleHeight + btnHeightMargen;
            }
            
            btn.xywh(x,y,w,btnTitleHeight);
            x = btnWidthMargen+CGRectGetMaxX(btn.frame);
        }
        
        self.height = y + btnTitleHeight + viewBottonMargen;
        
    }
    return self;
}

- (CGFloat)getHeight
{
    return self.height;
}

- (CGFloat)getBtnWidthWithName:(NSString *)name {
    CGFloat w = name.getWidth(Fnt(@btnTitleFontSize),btnTitleHeight);
    DLog(@"名字是：%@ > width=%f",name,w);
    return w+20;
}

- (UIButton *)getBtnWithName:(NSString *)name tag:(NSInteger)tag
{
    return (UIButton *)Button.btnFont(Fnt(@btnTitleFontSize)).btnAlign(UIControlContentHorizontalAlignmentCenter).nTitle(name).nTitleColor(color(333333)).targetAction(self, @selector(clickBtn:)).intoView(self).viewTag(tag).borderWidthRadius(color(000000),@1,@12.5).bgColor(color(f0f0f0f));
}

- (void)clickBtn:(UIButton *)btn
{
    DLog(@"btn.tag=%ld",btn.tag);
}

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

@end
