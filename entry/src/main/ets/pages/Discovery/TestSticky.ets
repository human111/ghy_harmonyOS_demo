import { singers } from './DiscoveryDataSource'


@Entry
@Component
struct TestSticky {
  // private testData: any[] = singers.slice(0,7)
  private testData: any[] = singers

  private scroller: Scroller = new Scroller()
  @State shortcutList: string[] = []
  @State currentScrollIndex: number = 0

  aboutToAppear() {
    this.testData.forEach((item: any) => {
      this.shortcutList.push(item.title)
    })
    console.log('===testData111==', JSON.stringify(this.shortcutList))
  }

  @Builder itemHead(text:string) {
    Text('111' + text)
      .width('100%').height(26).fontSize(16)
      .padding({left:10}).backgroundColor(0xcecece)
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        List({scroller: this.scroller}) {
          ListItem() {
            Text('ghy1116665')
              .width('100%')
              .height(40)
              .fontSize(16)
              .padding({ left: 10 })
              .backgroundColor(0xFFFFFF)
              .margin({ bottom: 1 })
          }
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
          this.currentScrollIndex = event
          console.log('===onScrollIndex==', event)
        })

        Column() {
          ForEach(this.shortcutList, (item: any, index: number) =>  {
            Text(item)
              .fontSize('12fp')
              .fontColor(this.currentScrollIndex === index + 1 ? '#31c27c' : '#fff')

          }, (item: any, index?: number) => index + JSON.stringify(item))
        }
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('20vp')
        .height('80%')
        .margin({right: '10vp'})
        .borderRadius('10vp')
        .backgroundColor('#FF8261')
        .visibility(this.currentScrollIndex > 1 ? Visibility.Visible: Visibility.Hidden)
      }
      .width('100%')
      .backgroundColor('#31c27c')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xcecece)
    .padding({ top: 5 })
  }}