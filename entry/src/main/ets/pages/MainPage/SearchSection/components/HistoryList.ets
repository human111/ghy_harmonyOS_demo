@Component
export struct HistoryList {

  @Builder SearchList() {
    List() {
      ForEach(['发扣扣','体温','哦辛苦','lx','开心','理论学科','海思科','海鲜','嘎了1','实打实','海鲜','嘎了','实打实'],
        (item: any, index?: number) => {
        ListItem() {
          Row() {
            Text(item)
              .fontSize(20)
              .fontColor('#222222')

            Blank()
            Image($r('app.media.ic_delete'))
              .width(20)
              .height(20)
          }
          .width('100%')
          .height(40)
          .justifyContent(FlexAlign.Center)
        }
      }, (item: any, index?: number) => index + JSON.stringify(item))
    }
    // .height(200)
  }

  build() {
    Column() {
      Row() {
        Text('历史搜索列表')
          .fontSize(20)
          .fontColor('#222222')

        Blank()
        Image($r('app.media.ic_clean'))
          .width(20)
          .height(20)
      }
      .width('100%')
      .height(40)
      .justifyContent(FlexAlign.Center)

      this.SearchList()
    }
    .width('100%')
    .padding({
      left: 20,
      right: 20
    })
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Start)
  }
}