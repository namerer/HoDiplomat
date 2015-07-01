# HoDiplomat
MyGitHub
Integrated QQ&&Wechat&&weibo login and share features,lighter weight and more convenient,.
Warning: You must installed the client before you can use WeChat .

Demo project use <Masonry> to layout .

.Masonry is a light-weight layout framework which wraps AutoLayout with a nicer syntax.
Masonry has its own layout DSL which provides a chainable way of describing your NSLayoutConstraints
which results in layout code that is more concise and readable. Masonry supports iOS and Mac OS X.
Click:https://github.com/SnapKit/Masonry

//lOGIN

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

//SHARE

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



