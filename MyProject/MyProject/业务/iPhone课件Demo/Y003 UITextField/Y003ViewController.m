//
//  Y003ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y003ViewController.h"
#import "Y003ViewModel.h"

@interface Y003ViewController () <UITextFieldDelegate>
@property (nonatomic,strong) Y003ViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong)UITextField* textFieldName;
@property(nonatomic,strong)UITextField* textFieldPassword;
@property(nonatomic,strong)UITextField* textFieldPhone;

@end

@implementation Y003ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Y003 UITextField";
    [self.rightNaviButton setTitle:@"提交" forState:UIControlStateNormal];
    WEAKSELF
    [self.rightNaviButton handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf submit];
    }];
    
    self.scrollView = [self createScrollView];
    [self.view addSubview:self.scrollView];
    
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
    
    [AJUtil runAfterDelay:0 block:^{
        [weakSelf.viewModel loadData];
    }];
}

-(void)updateViews{
    [self.scrollView removeAllSections];
    for (NSString *viewType in self.viewModel.viewTypeArray) {
        UIView *hintSection = [self createHintSectionWithViewType:viewType];
        [self.scrollView addSection:hintSection];
        
        UIView *section = [UIView newWith:[UIColor clearColor], nil];
        NSString *selector = [NSString stringWithFormat:@"create%@", viewType];
        UIView *subview = [AJUtil performSelector:NSSelectorFromString(selector) onTarget:self];
        
        [section addSubview:subview];
        section.size = CGSizeMake(self.scrollView.width, subview.height + 20);
        [subview layoutWithInsets:UIEdgeInsetsMake(EAuto, EAuto, EAuto, EAuto)]; // 定位
        
        [self.scrollView addSection:section];
    }
}


-(UIView*)createHintSectionWithViewType:(NSString*)viewType{
    NSDictionary *dict = @{@"TextFieldName": @"文本框（提示语，字体）",
                           @"TextFieldPassword": @"文本框（密码，圆角，边框）",
                           @"TextFieldPhone": @"文本框（限制长度，检查输入合法）",
                           };
    NSString *hint = [dict safeObjectFortKey:viewType];
    
    UILabel *label = [UILabel newWith: kFont12, kLightBlackColor, hint, nil];
    [label sizeToFit];
    
    UIView *section = [UIView newWith:[UIColor clearColor], nil];
    [section addSubview:label];
    section.size = CGSizeMake(self.scrollView.width, label.height + 10);
    [label layoutWithInsets:UIEdgeInsetsMake(EAuto, 15, EAuto, EAuto)]; // 定位
    
    return section;
}

//1、	输入框，提示语，对齐，大小，清除按钮x，键盘样式，键盘返回样式，密码格式，键盘返回
-(UITextField*)createTextFieldName{
    UITextField *textField = [UITextField new];
    textField.size = CGSizeMake(self.view.width-30, 25);
    textField.backgroundColor = kWhiteColor;
    textField.placeholder = @"请输入用户名";
    textField.font = kFont14;
    textField.clearButtonMode = UITextFieldViewModeAlways;//编辑内容是出线X
    textField.returnKeyType = UIReturnKeyNext; //键盘返回键设置
    textField.delegate = self;
    self.textFieldName = textField;
    return textField;
}

//1、	输入框，提示语，对齐，大小，清除按钮x，键盘样式，键盘返回样式，密码格式，键盘返回
-(UITextField*)createTextFieldPassword{
    UITextField *textField = [UITextField new];
    textField.size = CGSizeMake(self.view.width-30, 25);
    textField.backgroundColor = kWhiteColor;
    textField.placeholder = @"请输入密码";
    textField.font = kFont14;
    [textField setCornerRadiusWith:@(2), @(LINE_HEIGHT), kLightGrayColor, nil];
    textField.secureTextEntry = YES;
    textField.keyboardType = UIKeyboardTypeNamePhonePad;//输入框键盘输入样式
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;//编辑内容是出线X
    textField.returnKeyType = UIReturnKeyNext; //键盘返回键设置
    textField.delegate = self;
    self.textFieldPassword = textField;
    return textField;
}

-(UITextField*)createTextFieldPhone{
    UITextField *textField = [UITextField new];
    textField.size = CGSizeMake(self.view.width-30, 25);
    textField.backgroundColor = kWhiteColor;
    textField.placeholder = @"请输入手机号（11位）";
    textField.font = kFont14;
    textField.keyboardType = UIKeyboardTypeNumberPad;//输入框键盘输入样式
    textField.clearButtonMode = UITextFieldViewModeAlways;//编辑内容是出线X
    textField.returnKeyType = UIReturnKeySend; //键盘返回键设置
    textField.delegate = self;
    
    [textField handleEvent:UIControlEventEditingChanged withBlock:^(UIControl *control) {
        [AJUtil textField:(UITextField*)control limitMaxLength:11]; //限制文本框最大长度
    }];

    self.textFieldPhone = textField;
    return textField;
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.textFieldName) {
        [self.textFieldPassword becomeFirstResponder]; // 主动获取焦点
    }
    else if (textField == self.textFieldPassword) {
        [self.textFieldPhone becomeFirstResponder]; // 主动获取焦点
    }
    else{
        [self submit];
    }
    return YES;
}

-(void)submit{
    [self.view endEditing:YES]; //收起键盘
    self.viewModel.name = self.textFieldName.text;
    self.viewModel.password = self.textFieldPassword.text;
    self.viewModel.phone = self.textFieldPhone.text;
    if ([self.viewModel checkValid]) {
        [self.viewModel submit];
    }
}

@end
