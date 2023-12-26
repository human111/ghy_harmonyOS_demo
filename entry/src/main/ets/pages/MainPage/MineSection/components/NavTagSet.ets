@Component
export struct NavTagSet {
  @State tagSet: Array<Array<any>> = [
    [
      {icon: $r("app.media.mine_accompaniment"), iconDesc: '我的伴奏'},
      {icon: $r("app.media.mine_local_record"), iconDesc: '本地录音'},
      {icon: $r("app.media.mine_vip"), iconDesc: '我的VIP'},
      {icon: $r("app.media.mine_k_coin"), iconDesc: 'K币账户'},
    ],
    [
      {icon: $r("app.media.mine_collect"), iconDesc: '我的收藏'},
      {icon: $r("app.media.mine_download"), iconDesc: '本地下载'},
      {icon: $r("app.media.mine_transpond"), iconDesc: '我的转发'},
      {icon: $r("app.media.mine_more"), iconDesc: '更多'},
    ]
  ]

  build() {
    Column() {
      Grid() {
        ForEach(this.tagSet, (rowItem: Array<any>) => {
          ForEach(rowItem, (colItem: any) => {
            GridItem() {
              Column() {
                Image(colItem.icon)
                  .width('32vp')
                  .height('32vp')
                  .objectFit(ImageFit.Contain);

                Text(colItem.iconDesc)
                  .height('28vp')
                  .fontSize('14fp')
                  .fontColor('#222222')

              }
              .width('100%')
              .height('98vp')
              .padding({
                top: '20vp',
                bottom: '16vp'
              })

            }
          }, (colItem: any, index?: number) => index + JSON.stringify(colItem))
        }, (rowItem: any, index?: number) => index + JSON.stringify(rowItem))
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .height('196vp')
    }
    .width('100%')
    .margin({bottom: '12vp'})
    .backgroundColor('#FFFFFF')
  }
}