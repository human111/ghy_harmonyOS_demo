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
      .margin({
        right: 20,
        bottom: 10
      })
      .border({
        color: '#666666',
        radius: 6
      })
      .backgroundColor('#f0f0f0')
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .maxLines(2)
  }

  build() {
    Column() {
      Text('热门搜索')
        .fontSize('20fp')
        .fontColor('#182431')
        .fontWeight(500)
        .height('20vp')
        .margin({
          left: '12vp',
          bottom: '14vp'
        })

      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach([1,2,4,56,7783883837373738,99,33,66], (item: any, index?: number) => {
          this.HotTag('23234' + item)
        }, (item: any, index?: number) => index + JSON.stringify(item))
      }
      .padding({
        left: '14vp',
        right: '14vp'
      })
    }
    .width('100%')
    .margin({bottom: 20})
    .alignItems(HorizontalAlign.Start)
    // .backgroundColor(Color.Gray)
  }
}