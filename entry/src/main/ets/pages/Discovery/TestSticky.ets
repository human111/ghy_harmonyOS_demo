import { singers } from './DiscoveryDataSource'


@Entry
@Component
struct TestSticky {
  private testData: any[] = singers

  private scroller: Scroller = new Scroller()

  aboutToAppear() {
    console.log('===testData==', JSON.stringify((this.testData[1])))
  }

  @Builder itemHead(text:string) {
    Text('111' + text)
      .width('100%').height(26).fontSize(16)
      .padding({left:10}).backgroundColor(0xcecece)
  }

  build() {

    Column() {
      List({scroller: this.scroller}) {
        ForEach(this.testData, (item) => {
          ListItemGroup({ header: this.itemHead(item.title) }) {
            ForEach(item.list, (subItem: any) =>  {
              ListItem() {
                Text('' + subItem.name)
                  .width('100%')
                  .height(40)
                  .fontSize(16)
                  .padding({ left: 10 })
                  .backgroundColor(0xFFFFFF)
                  .margin({ bottom: 1 })
              }
            }, (subItem: any, index?: number) => index + JSON.stringify(subItem))
          }
          .borderRadius(20)
          .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
        }, (item: any, index?: number) => index + JSON.stringify(item.title))
      }
      .width('100%')
      .sticky(StickyStyle.Header)
      .onScrollIndex(event => {
        console.log('===onScrollIndex==', event)
      })
    }.width('100%').height('100%').backgroundColor(0xcecece).padding({ top: 5 })
  }}