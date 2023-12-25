@Component
export struct SuggestedList {
  @Builder SearchResultList() {
    List() {
      ForEach(['发扣扣','体温','发扣扣','体温','哦辛苦','lx','开心','理论学科','海思科','海鲜','嘎了1','实打实','海鲜','嘎了','实打实'],
        (item: any, index?: number) => {
          ListItem() {
            Row() {
              Image($r('app.media.ic_music'))
                .width(30)
                .height(30)
                .margin({right: 12})
              Text(item)
                .fontSize(20)
                .fontColor('#222222')
            }
            .width('100%')
            .height(36)
            .justifyContent(FlexAlign.Start)
            .margin({bottom: 10})
          }
        }, (item: any, index?: number) => index + JSON.stringify(item))
    }
  }

  build() {
    Column() {
      this.SearchResultList()
    }
    .width('100%')
    .layoutWeight(1)
    .padding({
      left: 20,
      right: 20
    })
    .margin({bottom: 20})
    .alignItems(HorizontalAlign.Start)
  }
}