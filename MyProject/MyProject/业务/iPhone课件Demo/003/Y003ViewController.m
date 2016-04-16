//
//  Y003ViewController.m
//  MyProject
//
//  Created by caoyang on 16/4/16.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "Y003ViewController.h"

@interface Y003ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField* textField1;
@property(nonatomic,strong)UITextField* textField2;
@end

@implementation Y003ViewController


-(instancetype)init{
    if (self=[super init]) {
        self.title = @"Iphone课件003";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self TextField1];
    [self TextField2];
}

//输入框，提示语，清除按钮，键盘样式，键盘返回（收起），密码
-(void)TextField1{
    _textField1 = [[UITextField alloc]init];
    _textField1.frame = CGRectMake(50, 100, 220, 35);
    _textField1.borderStyle = UITextBorderStyleLine; //外边框样式
    _textField1.placeholder = @"请输入你的电话号";     //输入框提示语
    _textField1.keyboardType = UIKeyboardTypePhonePad;//输入框键盘输入样式
    [_textField1 setSecureTextEntry:YES];//密码形式
    _textField1.returnKeyType = UIReturnKeyGo; //键盘返回键设置
    _textField1.clearButtonMode = UITextFieldViewModeWhileEditing;//编辑内容是出线X
    _textField1.delegate = self;
    [self.view addSubview:_textField1];
}
//触摸屏幕退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    [_textField1 resignFirstResponder];
    [_textField2 resignFirstResponder];
    
    //获取文本、截取固定长度字符串
    NSString* str = _textField1.text;
    
    NSRange makeRange = NSMakeRange(0, 10);
    NSString* rangeStr = [str substringWithRange:makeRange];
    NSLog(@"%@",rangeStr);
    
}
//点击右下角按钮退出键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField1 resignFirstResponder];
    [_textField2 resignFirstResponder];
    
    return YES;
}



//限制长度，截取固定长度字符串，获取文本
-(void)TextField2{
    _textField2 = [[UITextField alloc]init];
    _textField2.frame = CGRectMake(50, 160, 220, 35);
    _textField2.borderStyle = UITextBorderStyleLine; //外边框样式
    _textField2.placeholder = @"请输入你的信息";     //输入框提示语
    _textField2.returnKeyType = UIReturnKeyGo; //键盘返回键设置
    _textField2.clearButtonMode = UITextFieldViewModeWhileEditing;//编辑内容是出线X
    _textField2.delegate = self;
    [self.view addSubview:_textField2];
}
// 限制字符串长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField.text.length>=20){
        textField.text = [textField.text substringToIndex:20];
    }
    
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
