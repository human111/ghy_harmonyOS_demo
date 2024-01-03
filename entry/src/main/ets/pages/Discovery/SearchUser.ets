@Entry
@Component
struct SearchUser {
  private avatarArr: Array<Resource> = [
    $r('app.media.ghy_singer_1'), $r('app.media.ghy_singer_2'),
    $r('app.media.ghy_singer_3'), $r('app.media.ghy_singer_5'),
    $r('app.media.ghy_singer_6'), $r('app.media.ghy_singer_8'),
    $r('app.media.ghy_singer_9'), $r('app.media.ghy_singer_10'),
    $r('app.media.discovery_singer_4'), $r('app.media.message_audience_2')
  ]
  private nameArr: Array<string> = [
    '春风十里 (Live)', '下一秒', '水给生灵', '落日下的海与你', '捕梦记',
    '百川归海', '告别季节', '萤火飞光不良人', '离职已过万重山', '明天有梦'
  ]
  private refererArr: Array<string> = [
    'QQ好友', '好友的好友', '微信好友', '电话好友', '抖音好友',
    '小红书好友', '哔哩哔哩搭子', '掘金文友', 'Google搜友', 'AI GC'
  ]
  @State interestedUsers: Array<any> = [
    {
      avatar: $r('app.media.message_audience_2'),
      name: '阿兰兰兰',
      fans: 6986,
      works: 356,
      referer: '微信好友',
    },
    {
      avatar: $r('app.media.ic_good'),
      name: '以前',
      fans: 13748,
      works: 56,
      referer: '电话好友',
    }
  ]
  @State text: string = ''
  private controller: TextInputController = new TextInputController()

  randomRefreshUsers() {
    this.interestedUsers = [];
    var randomNum = Math.round(Math.random() * 20)

    for (let index = 0; index < randomNum; index++) {
      const idx = Math.floor(Math.random() * 10);
      this.interestedUsers.push({
        avatar: this.avatarArr[idx],
        name: this.nameArr[idx],
        fans: Math.floor(Math.random() * 10000),
        works: Math.floor(Math.random() * 100),
        referer: this.refererArr[idx],
      })
    }
  }

  build() {
    Column() {
      Row() {
        Row() {
          Image($r('app.media.discovery_search'))
            .width('20vp')
            .height('20vp')
            .translate({y: '1vp'})

          TextInput({
            text: this.text,
            placeholder: '搜索',
            controller: this.controller
          })
            .placeholderColor('#a6a6a6')
            .placeholderFont({ size: 14, weight: 400 })
            .caretColor('#80b8f6')
            .height('100%')
            .layoutWeight(1)
            .fontSize(14)
            .fontColor('#222222')
            .padding({left: '6vp'})
            .backgroundColor('#FFFFFF')
            // .backgroundColor(Color.Red)
            .inputFilter('[a-z]', (e) => {
              console.log(JSON.stringify(e))
            })
            .onChange((value: string) => {
              this.text = value
            })

          Image($r('app.media.ic_delete'))
            .width('16vp')
            .height('16vp')
            .onClick(() => {
              this.text = ''
            })

        }
        // .flexGrow(1)
        .layoutWeight(1)
        .height('30vp')
        .padding({left: '10vp', right: '10vp'})
        .margin({right: '14vp'})
        .borderRadius('15vp')
        .backgroundColor('#FFFFFF')

        Text('取消')
          .fontSize('14fp')
          .fontColor('#222222')
      }
      .width('100%')
      .padding({left: '20vp', right: '15vp'})
      .margin({top: '20vp'})


      Row() {
        Text('以下用户您可能感兴趣').fontSize('12fp').fontColor('#80b8f6').margin({right: '16vp'})

        Row() {
          Image($r('app.media.discovery_refresh'))
            .width('20vp')
            .height('20vp')
            .margin({right: '4vp'})
          Text('换一批').fontSize('12fp').fontColor('#808080')
        }
        .onClick(() => {
          this.randomRefreshUsers()
        })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('95%')
      .padding('10vp')
      .margin({top: '20vp', bottom: '10vp'})
      .backgroundColor('#e5e5e5')
      .borderRadius('12vp')
      .border({
        width: {
          bottom: '1vp'
        },
        color: '#f0f0f0'
      })

      List() {
        ForEach(this.interestedUsers, (userItem: any) => {
          ListItem() {
            Row() {
              Image(userItem.avatar)
                .width('65vp')
                .height('62vp')
                .margin({right: '10vp'})
                .borderRadius('12vp')

              Column() {
                Text(userItem.name)
                  .fontColor('#222222')
                  .fontSize('14fp')
                  .height('20vp')

                Row({space: 5}) {
                  Text(`粉丝：${userItem.fans}人`)
                    .height('16vp')
                    .fontSize('10fp')
                    .fontColor('#999999')

                  Text(`作品：${userItem.works}`)
                    .height('16vp')
                    .fontSize('10fp')
                    .fontColor('#999999')

                  Text(userItem.referer)
                    .height('16vp')
                    .fontSize('10fp')
                    .fontColor('#999999')
                }
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Row() {
                Image($r('app.media.discovery_add_user'))
                  .width('20vp')
                  .height('20vp')
              }
              .justifyContent(FlexAlign.Center)
              .width('50vp')
              .height('20vp')
              .backgroundColor('#ff5050')
              .borderRadius('10vp')

            }
            .alignItems(VerticalAlign.Center)
            .padding({top: '10vp', right: '15vp', bottom: '10vp', left: '15vp'})
            .margin({right: '10vp', bottom: '10vp', left: '10vp'})
            .borderRadius('10vp')
            .backgroundColor('#FFFFFF')
          }
        }, (item: any, index?: number) => index + JSON.stringify(item))
      }
      .width('100%')
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .layoutWeight(1)

    }
    .height('100%')
    .backgroundColor('#f4f4f4')
  }
}