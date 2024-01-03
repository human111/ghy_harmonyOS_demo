@Entry
@Component
struct PrivateMessage {
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
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string, borderRadius: BorderRadiuses) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? '#ff5050' : '#505050')
        .fontSize('13vp')
        .lineHeight('24vp')
        .height('39vp')
      Divider()
        .width('95vp')
        .strokeWidth(1)
        .color('#ff5050')
        .opacity(this.currentIndex === index ? 1 : 0)
    }
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius(borderRadius)
  }

  @Builder PrivateMessageList() {
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
          .margin({right: '10vp', top: '10vp', left: '10vp'})
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

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          this.PrivateMessageList()
        }
        .tabBar(this.TabBuilder(0, '已关注', {
          topLeft: '12vp',
          bottomLeft: '12vp'
        }))
        .align(Alignment.Top)

        TabContent() {
          this.PrivateMessageList()
        }
        .tabBar(this.TabBuilder(1, '未关注', {
          topRight: '12vp',
          bottomRight: '12vp'
        }))
        .align(Alignment.Top)
      }
      .barMode(BarMode.Fixed)
      .barHeight('40vp')
      .animationDuration(100)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .margin({top: '10vp', left: 10, right: 10})

    }
    .height('100%')
    .backgroundColor('#f4f4f4')
  }
}