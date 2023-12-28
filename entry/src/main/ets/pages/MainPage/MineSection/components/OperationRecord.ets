import { AccompanimentChorus } from './AccompanimentChorus'
import { MySongs } from './MySongs'
import { PersonalDynamics } from './PersonalDynamics'
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
          PersonalDynamics()
        }.tabBar(this.TabBuilder(0, '动态'))

        TabContent() {
          MySongs()
        }.tabBar(this.TabBuilder(1, '作品6'))

        TabContent() {
          AccompanimentChorus()
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
    }
    .height('100%')
    .width('100%')
    .padding({left: '12vp', right: '12vp'})
    .margin({bottom: '20vp'})
    .backgroundColor('#FFFFFF')
  }
}