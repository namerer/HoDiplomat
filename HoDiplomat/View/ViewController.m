//
//  ViewController.m
//  HoDiplomat
//
//  Created by Hao on 15/7/1.
//  Copyright (c) 2015年 Ho. All rights reserved.
//

#import "ViewController.h"

static enum WXScene kWechatScene = WXSceneSession;

NS_ENUM(NSInteger,DiplomatButtonType)
{
    
    DiplomatButtonTypeLoginQQ               = 1000,
    DiplomatButtonTypeLoginWeiBo            = 1001,
    DiplomatButtonTypeLoginWeChat           = 1002,
    
    DiplomatButtonTypeShareTextToQQ         = 1003,
    DiplomatButtonTypeShareTextToWeiBo      = 1004,
    DiplomatButtonTypeShareTextToWeChat     = 1005,
    
    DiplomatButtonTypeShareImageToQQ        = 1006,
    DiplomatButtonTypeShareImageToWeiBo     = 1007,
    DiplomatButtonTypeShareImageToWeChat    = 1008,
    
    DiplomatButtonTypeShareMusicToQQ        = 1009,
    DiplomatButtonTypeShareMusicToWeiBo     = 1010,
    DiplomatButtonTypeShareMusicToWeChat    = 1011,
    
    DiplomatButtonTypeShareVideoToQQ        = 1012,
    DiplomatButtonTypeShareVideoToWeiBo     = 1013,
    DiplomatButtonTypeShareVideoToWeChat    = 1014,
    
    
    DiplomatButtonTypeShareWebPageToQQ      = 1015,
    DiplomatButtonTypeShareWebPageToWeiBo   = 1016,
    DiplomatButtonTypeShareWebPageToWeChat  = 1017,
    
};

@interface ViewController ()

@property(nonatomic,strong)UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayUI];
}

-(void)displayUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *imageArray =@[@"ico_qq",@"ico_weibo",@"ico_weixin"];
    NSArray *textArray = @[@"登录:",@"分享文本:",@"分享图片:",@"分享音乐:",@"分享视频:",@"分享网页:"];
    
    for (int i = 0; i<18; i++)
    {
        if (i%3==0)
        {
            UILabel *diplomatLabel = [[UILabel alloc]init];
            diplomatLabel.text =textArray[i/3];
            diplomatLabel.frame = CGRectMake(20,windowHeight/8*(i/3)+35 , 100, 20);
            diplomatLabel.font =[UIFont systemFontOfSize:13];
            [self.view addSubview:diplomatLabel];
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:imageArray[i%3]] forState:UIControlStateNormal];
        button.tag = DiplomatButtonTypeLoginQQ+i;
        [button addTarget:self action:@selector(diplomatLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(windowHeight/8*(i/3)+60);
            
            make.left.mas_equalTo(windowWidth/3*(i%3)+30);
           
            make.width.mas_equalTo(35);
            
            make.height.mas_equalTo(40);
            
        }];
        
    }
    
    _contentLabel =[[UILabel alloc]initWithFrame:CGRectMake(20,windowHeight-100, windowWidth-40, 100)];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.numberOfLines=0;
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.textColor = UIColorFromRGB(0x394641);
    _contentLabel.text = @"返回结果:";
    [self.view addSubview:_contentLabel];
}
-(void)diplomatLoginButtonClicked:(UIButton *)sender
{
    
    switch (sender.tag)
    {
    //登录
        case DiplomatButtonTypeLoginQQ:
            
        {
            [self loginWithType:kDiplomatTypeQQ];
        }
            
            break;
        case DiplomatButtonTypeLoginWeiBo:
            
        {
            [self loginWithType:kDiplomatTypeWeibo];
        }
            
            break;
        case DiplomatButtonTypeLoginWeChat:
            
        {
            [self loginWithType:kDiplomatTypeWechat];
        }
            break;
            
      //分享文本
        case DiplomatButtonTypeShareTextToQQ:
            
        {
            [self shareMessage:[self generateTextMessage] type:kDiplomatTypeQQ];
        }
            
            break;
        case DiplomatButtonTypeShareTextToWeiBo:
            
        {
             [self shareMessage:[self generateTextMessage] type:kDiplomatTypeWeibo];
        }
            
            break;
        case DiplomatButtonTypeShareTextToWeChat:
            
        {
            [self shareMessage:[self generateTextMessage] type:kDiplomatTypeWechat];
        }
            break;
            
     //分享图片
        case DiplomatButtonTypeShareImageToQQ:
            
        {
            [self shareMessage:[self generateImageMessage] type:kDiplomatTypeQQ];
        }
            
            break;
        case DiplomatButtonTypeShareImageToWeiBo:
            
        {
            [self shareMessage:[self generateImageMessage] type:kDiplomatTypeWeibo];
        }
            
            break;
        case DiplomatButtonTypeShareImageToWeChat:
            
        {
            [self shareMessage:[self generateImageMessage] type:kDiplomatTypeWechat];
        }
             break;

      //分享音乐
            
        case DiplomatButtonTypeShareMusicToQQ:
            
        {
            [self shareMessage:[self generateMusicMessage] type:kDiplomatTypeQQ];
        }
            
            break;
        case DiplomatButtonTypeShareMusicToWeiBo:
            
        {
            [self shareMessage:[self generateMusicMessage] type:kDiplomatTypeWeibo];
        }
            
            break;
        case DiplomatButtonTypeShareMusicToWeChat:
            
        {
            [self shareMessage:[self generateMusicMessage] type:kDiplomatTypeWechat];
        }
             break;
    
        //分享视频
        case DiplomatButtonTypeShareVideoToQQ:
            
        {
            [self shareMessage:[self generateVideoMessage] type:kDiplomatTypeQQ];
        }
            
            break;
        case DiplomatButtonTypeShareVideoToWeiBo:
            
        {
            [self shareMessage:[self generateVideoMessage] type:kDiplomatTypeWeibo];
        }
            
            break;
        case DiplomatButtonTypeShareVideoToWeChat:
            
        {
            [self shareMessage:[self generateVideoMessage] type:kDiplomatTypeWechat];
        }
             break;
            
        //分享网页
        case DiplomatButtonTypeShareWebPageToQQ:
            
        {
            [self shareMessage:[self generateWebPageMessage] type:kDiplomatTypeQQ];
        }
            
            break;
        case DiplomatButtonTypeShareWebPageToWeiBo:
            
        {
            [self shareMessage:[self generateWebPageMessage] type:kDiplomatTypeWeibo];
        }
            
            break;
        case DiplomatButtonTypeShareWebPageToWeChat:
            
        {
            [self shareMessage:[self generateWebPageMessage] type:kDiplomatTypeWechat];
        }
            break;


            

      
            
        default:
            break;
    }
}

- (void)loginWithType:(NSString *)type
{
    [[Diplomat sharedInstance] authWithName:type
                                  completed:^(id result, NSError *error) {
                                      [self showText:result];
                                      if (result) {
                                          [self showText:result];
                                          return ;
                                      }
                                      if (error) {
                                          [self showText:error];
                                      }
                                  }];
}

- (void)shareMessage:(DTMessage *)message type:(NSString *)name
{
    [[Diplomat sharedInstance] share:message
                                name:name
                           completed:^(id result, NSError *error) {
                               if (result) {
                                   [self showText:result];
                                   return ;
                               }
                               if (error) {
                                   [self showText:error];
                               }
                           }];
}

- (void)showText:(id)result
{
    NSString *text = [NSString stringWithFormat:@"返回结果:\n%@", result];
    self.contentLabel.text = text;
}


- (DTMessage *)generateTextMessage
{
    DTTextMessage *message = [[DTTextMessage alloc] init];
    message.text = @"Share Text";
    message.userInfo = @{kWechatSceneTypeKey: @(kWechatScene)};
    
    return message;
}

- (DTMessage *)generateImageMessage
{
    DTImageMessage *message = [[DTImageMessage alloc] init];
    message.title = @"浪漫铁道";
    message.desc = @"浪漫的铁道.";
    message.imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"music.jpg"], 0.75);;
    message.thumbnailableImage = [UIImage imageNamed:@"music.jpg"];
    message.userInfo = @{kWechatSceneTypeKey: @(kWechatScene)};
    
    return message;
}

- (DTMessage *)generateMusicMessage
{
    DTAudioMessage *message = [[DTAudioMessage alloc] init];
    message.messageId = @"Message's id";
    message.title = @"浪漫铁道";
    message.desc = @"张学友|陈奕迅--<遥远的她>--日语原版.";
    message.audioUrl = @"http://music.baidu.com/song/s/73087d59a962010";
    message.audioDataUrl = @"http://music.baidu.com/song/2103028066/download?title=&pst=naga&fr=img||image.baidu.com";
    message.thumbnailableImage = [UIImage imageNamed:@"music"];
    message.userInfo = @{kWechatSceneTypeKey: @(kWechatScene)};
    
    return message;
}

- (DTMessage *)generateVideoMessage
{
    DTVideoMessage *message = [[DTVideoMessage alloc] init];
    message.messageId = @"Video's id";
    message.title = @"浪漫铁道(遥远的她)";
    message.desc = @"学友与谷村新司大师合唱浪漫铁道(遥远的她)";
    message.videoUrl = @"http://v.youku.com/v_show/id_XMTY4MTY4NTQ0.html?from=s1.8-1-1.2";
    message.videoDataUrl = @"http://v.youku.com/v_show/id_XMTY4MTY4NTQ0.html?from=s1.8-1-1.2";
    message.thumbnailableImage = [UIImage imageNamed:@"music"];
    message.userInfo = @{kWechatSceneTypeKey: @(kWechatScene)};
    
    return message;
}

- (DTMessage *)generateWebPageMessage
{
    DTPageMessage *message = [[DTPageMessage alloc] init];
    message.title = @"浪漫铁道歌词";
    message.desc = @"浪漫樱花日文原版歌词+++翻译";
    message.webPageUrl = @"http://zhidao.baidu.com/link?url=EKC-MrHGXyrcZWrQNQLEB-FWb2yMUsji0Fh9oZW-UZYIzKFXUgPd5i4RkeYCMSOBufkoAcJ6E4evnFQGUT0yJ_";
    message.userInfo = @{kWechatSceneTypeKey: @(kWechatScene)};
    
    return message;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
