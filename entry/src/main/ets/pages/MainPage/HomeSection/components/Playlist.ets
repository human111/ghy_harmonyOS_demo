@Component
export struct Playlist {

  @Builder PlayItem() {
    Row() {
      Image($r('app.media.ic_good'))
        .width(60)
        .height(60)
        .borderRadius(32)
        .margin({right: '12vp'})

      Column() {
        Text('今天星期几')
        Blank()
          .padding({top: '8vp'})
        Text('可根据理解啊了就发觉疗法')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      // .backgroundColor(Color.Green)
    }
    .padding({bottom: '16vp'})
    // .backgroundColor(Color.Grey)
  }


  build() {
    List() {
      ForEach([1,2,3,4,5,6,7,8,9], (item: any) => {
        ListItem() {
          Column() {
            this.PlayItem()
          }
          .margin({
            left: $r('app.float.default_14'),
            right: $r('app.float.default_14')
          })
        }
      }, (item: any, index?: number) => index + JSON.stringify(item))
    }
    .width('100%')
    .layoutWeight(1)
    // .lanes(2)
    .scrollBar(BarState.Off)
    .divider({
      color: '#1a182431',
      strokeWidth: $r('app.float.stroke_width'),
      startMargin: $r('app.float.default_56'),
    })
  }
}