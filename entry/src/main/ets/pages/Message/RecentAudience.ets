@Entry
@Component
struct RecentAudience {
  @State audiences: Array<any> = [
    {
      avatar: $r('app.media.message_audience_1'),
      name: '阿兰兰兰',
      date: '2024-01-02 19:45',
      activity: '访问了你的主页'
    },
    {
      avatar: $r('app.media.message_audience_2'),
      name: '江直树',
      date: '2024-01-01 23:28',
      activity: '收听了《告白气球》'
    },
    {
      avatar: $r('app.media.message_audience_3'),
      name: '帅气',
      date: '2023-12-31 14:01',
      activity: '收听了《话不是因为你长得不好看》'
    }
  ]

  build() {
    Column() {
      Row() {
        Text('今日收听量:845').fontSize('12fp').fontColor('#80b8f6').margin({right: '16vp'})
        Text('总收听量:54').fontSize('12fp').fontColor('#808080')
      }
      .justifyContent(FlexAlign.Center)
      .width('80%')
      .padding({top: '10vp', right: '10vp', bottom: '15vp', left: '10vp'})
      .margin({top: '10vp', bottom: '10vp'})
      .backgroundColor('#e5e5e5')
      .borderRadius('12vp')
      .border({
        width: {
          bottom: '1vp'
        },
        color: '#f0f0f0'
      })

      List() {
        ForEach(this.audiences, (audienceItem: any) => {
          ListItem() {
            Row() {
              Image(audienceItem.avatar)
                .width('65vp')
                .height('62vp')
                .margin({right: '10vp'})
                .borderRadius('12vp')

              Column() {
                Flex({justifyContent: FlexAlign.SpaceBetween}) {
                  Text(audienceItem.name)
                    .fontColor('#222222')
                    .fontSize('14fp')

                  Text(audienceItem.date)
                    .fontColor('#666666')
                    .fontSize('12fp')

                }
                .height('20vp')

                Text(audienceItem.activity)
                  .height('22vp')
                  .fontSize('12fp')
                  .fontColor('#999999')
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            }
            .alignItems(VerticalAlign.Top)
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