@Component
export struct HotSearch {
  @Builder HotTag(tag: string) {
    Text(tag)
      .padding({
        top: 5,
        bottom: 5,
        left: 10,
        right: 10
      })
      .border({
        color: '#666666',
        radius: 6
      })
      .backgroundColor('#f0f0f0')
      .margin({
        right: 20,
        bottom: 10
      })
  }

  build() {
    Column() {
      Text('热门搜索')
        .margin({bottom: 20})
        .fontSize(20)
        .fontColor('#222222')

      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach([1,2,4,56,77,99,33,66], (item: any, index?: number) => {
          this.HotTag('23234' + item)
        }, (item: any, index?: number) => index + JSON.stringify(item))
      }
    }
    .width('100%')
    .padding({
      left: 20,
      right: 20
    })
    .margin({bottom: 20})
    .alignItems(HorizontalAlign.Start)
    // .backgroundColor(Color.Gray)
  }
}