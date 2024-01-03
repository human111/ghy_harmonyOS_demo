@Entry
@Component
struct Contest {
  @State officialContest: Array<any> = [
    {
      avatar: $r('app.media.message_audience_1'),
      name: '阿兰兰兰',
      remainingDays: '12',
      numberEntries: '47583'
    },
    {
      avatar: $r('app.media.message_audience_2'),
      name: '江直树',
      remainingDays: '56',
      numberEntries: '2345'
    },
    {
      avatar: $r('app.media.message_audience_3'),
      name: '帅气',
      remainingDays: '28',
      numberEntries: '98372'
    }
  ]
  @State mineContest: Array<any> = [
    {
      avatar: $r('app.media.ghy_singer_1'),
      name: '萤火飞光不良人',
      remainingDays: '12',
      numberEntries: '47583'
    },
    {
      avatar: $r('app.media.ghy_singer_2'),
      name: '百川归海',
      remainingDays: '56',
      numberEntries: '2345'
    },
    {
      avatar: $r('app.media.ghy_singer_3'),
      name: '帅气捕梦记',
      remainingDays: '28',
      numberEntries: '98372'
    },
    {
      avatar: $r('app.media.ghy_singer_8'),
      name: '离职已过万重山',
      remainingDays: '7',
      numberEntries: '45632'
    },
    {
      avatar: $r('app.media.ghy_singer_9'),
      name: '明天有梦',
      remainingDays: '137',
      numberEntries: '5354'
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

  @Builder ContestList(contestData: any) {
    List() {
      ForEach(contestData, (contestItem: any) => {
        ListItem() {
          Column() {
            Image(contestItem.avatar)
              .width('100%')
              .height('130vp')

            Column() {
              Text(contestItem.name)
                .height('20vp')
                .fontWeight(500)
                .fontColor('#222222')
                .fontSize('14fp')

              Text(`${contestItem.numberEntries}首参赛作品  距离结束还有：${contestItem.remainingDays}天`)
                .height('15vp')
                .fontSize('12fp')
                .fontColor('#666666')
            }
            .width('100%')
            .padding({top: '9vp', right: '15vp', bottom: '10vp', left: '10vp'})
            .alignItems(HorizontalAlign.Start)
          }
          .margin({top: '10vp'})
          .borderRadius('8vp')
          .backgroundColor('#FFFFFF')
          .clip(true)
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
          this.ContestList(this.officialContest)
        }
        .tabBar(this.TabBuilder(0, '官方大赛', {
          topLeft: '12vp',
          bottomLeft: '12vp'
        }))
        .align(Alignment.Top)

        TabContent() {
          this.ContestList(this.mineContest)
        }
        .tabBar(this.TabBuilder(1, '我的大赛', {
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
      .margin('10vp')

    }
    .height('100%')
    .backgroundColor('#f4f4f4')
  }
}