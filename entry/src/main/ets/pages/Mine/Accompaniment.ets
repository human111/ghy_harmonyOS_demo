@Entry
@Component
struct Accompaniment {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()
  private accompanimentList: Array<any> = [
    {
      accompanimentName: '小拳拳锤你（说唱版）',
      accompanimentSinger: '',
      accompanimentFileSize: ' 0.21MB',
      accompanimentTags: [
        {tagName: '说唱', color: '#ff9900'},
        {tagName: '评分', color: '#3863a7'},
        {tagName: 'HQ', color: '#01c101'}
      ]
    },
    {
      accompanimentName: '日不落',
      accompanimentSinger: '蔡依林',
      accompanimentFileSize: ' 5.21MB',
      accompanimentTags: [
        {tagName: '说唱', color: '#ff9900'},
        {tagName: 'HQ', color: '#01c101'}
      ]
    }
  ]

  private trainingList: Array<any> = [
    {
      accompanimentName: '同桌的你',
      accompanimentSinger: '以前157',
      accompanimentFileSize: ' 3.14MB',
      accompanimentTags: [
        {tagName: '评分', color: '#3863a7'},
        {tagName: 'HQ', color: '#01c101'}
      ]
    },
    {
      accompanimentName: '兰亭序',
      accompanimentSinger: '周杰伦',
      accompanimentFileSize: ' 9.37MB',
      accompanimentTags: [
        {tagName: '评分', color: '#3863a7'},
      ]
    }
  ]

  @Builder TabBuilder(index: number, name: string) {
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
    }.width('100%').backgroundColor('#FFFFFF')
  }

  @Builder TagBuilder(tagName: string, color: string) {
    Text(tagName)
      .height('20vp')
      .padding({left: '4vp', right: '4vp'})
      .margin({left: '8vp'})
      .fontSize('12fp')
      .fontColor(color)
      .border({
        width: '1vp',
        color: color,
        radius: '5vp'
      })
  }

  @Builder AccompanimentItem(item: any) {
    Row() {
      Column() {
        Row() {
          // 文本省略号
          Text(`${item.accompanimentName}`.split('').join('\u200B'))
            .height('20vp')
            .constraintSize({maxWidth: '80%'})
            .fontSize('14fp')
            .fontColor('#222222')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)

          if (item.accompanimentSinger) {
            Text(item.accompanimentSinger)
              .height('20vp')
              .margin({left: '4vp'})
              .fontSize('12fp')
              .fontColor('#808080')
          }

          if (item.accompanimentTags) {
            ForEach(item.accompanimentTags, (tagItem: any) =>  {
              this.TagBuilder(tagItem.tagName, tagItem.color)
            }, (item: any, index?: number) => index + JSON.stringify(item))
          }
        }

        Text(item.accompanimentFileSize)
          .height('15vp')
          .fontSize('12fp')
          .fontColor('#333333')
      }
      .flexGrow(1)
      .alignItems(HorizontalAlign.Start)

      Button('K歌', { type: ButtonType.Capsule, stateEffect: true })
        .backgroundColor('#FFFFFF')
        .width('50vp')
        .height('20vp')
        .fontColor('#808080')
        .border({
          width: '1vp',
          color: '#cccccc'
        })

    }
    .width('100%')
    .height('58vp')
    .padding({left: '10vp', right: '5vp'})
    .border({
      width: {
        bottom: '1vp'
      },
      color: '#f0f0f0'
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
            ForEach(this.accompanimentList, (item: any) =>  {
              this.AccompanimentItem(item)
            }, (item: any, index?: number) => index + JSON.stringify(item))
          }
          .height('100%')
          .padding({left: '10vp', right: '10vp', top: '12vp', bottom: '8vp'})
          .alignItems(HorizontalAlign.Start)

        }.tabBar(this.TabBuilder(0, '已点伴奏'))

        TabContent() {
          Column() {
            ForEach(this.trainingList, (item: any) =>  {
              this.AccompanimentItem(item)
            }, (item: any, index?: number) => index + JSON.stringify(item))
          }
          .height('100%')
          .padding({left: '10vp', right: '10vp', top: '12vp', bottom: '8vp'})
          .alignItems(HorizontalAlign.Start)
        }.tabBar(this.TabBuilder(1, '练唱列表'))
      }
      .barMode(BarMode.Fixed)
      .barHeight('40vp')
      .animationDuration(100)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .margin({bottom: '20vp'})
    .backgroundColor('#ffffff')
  }
}