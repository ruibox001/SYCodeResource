//
//  SFAgreetmentView.m
//  Tronker
//
//  Created by 王声远 on 2017/6/22.
//  Copyright © 2017年 Shenzhen Soffice Software. All rights reserved.
//

#import "SFAgreementManagerView.h"

@interface SFAgreementManagerView()

@property (nonatomic,strong) UIButton *agreementBtn;
@property (nonatomic,copy) void (^clickProtocolBlock)(BOOL select);

@end

@implementation SFAgreementManagerView

- (instancetype) initWithFrame:(CGRect)frame leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor font:(UIFont *)font protocolClick:(void (^)(BOOL select))block
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.clickProtocolBlock = block;
        self.agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.agreementBtn setFrame:self.bounds];
        [self addSubview:self.agreementBtn];
        self.agreementBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.agreementBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        self.agreementBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        
        [self.agreementBtn setImage:[UIImage imageNamed:@"agreement_status_unselect"] forState:UIControlStateNormal];
        [self.agreementBtn setImage:[UIImage imageNamed:@"agreement_status_select"] forState:UIControlStateSelected];
        
        NSString *t = [NSString stringWithFormat:@"%@%@",leftTitle,rightTitle];
        NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:t];
        [attributeString addAttribute:NSForegroundColorAttributeName value:rightColor range:NSMakeRange(leftTitle.length, rightTitle.length)];
        [attributeString addAttribute:NSForegroundColorAttributeName value:leftColor range:NSMakeRange(0, leftTitle.length)];
        [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, t.length)];
        
        [self.agreementBtn setAttributedTitle:attributeString forState:UIControlStateNormal];
        [self.agreementBtn setAttributedTitle:attributeString forState:UIControlStateSelected];
        
        [self.agreementBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)clickBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (self.clickProtocolBlock) {
        self.self.clickProtocolBlock(btn.selected);
    }
}

- (BOOL)agreeProtocol
{
    return self.agreementBtn.selected;
}

@end
