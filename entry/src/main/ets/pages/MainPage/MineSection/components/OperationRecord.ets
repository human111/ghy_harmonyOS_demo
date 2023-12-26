@Component
export struct OperationRecord {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? '#ff5050' : '#505050')
        .fontSize('18vp')
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight('24vp')
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#ff5050')
        .margin({left: '12vp', right: '12vp'})
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.TabBuilder(0, '动态'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar(this.TabBuilder(1, '作品6'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(this.TabBuilder(2, '伴奏与合唱'))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      // .barWidth(360)
      .barHeight('56vp')
      .animationDuration(100)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      // .width(360)
      .height(296)
      // .backgroundColor('#F1F3F5')
    }
    .width('100%')
    .padding({left: '12vp', right: '12vp'})
    .margin({bottom: '20vp'})
    .backgroundColor('#FFFFFF')

  }
}