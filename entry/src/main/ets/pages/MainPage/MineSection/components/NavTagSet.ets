@Component
export struct NavTagSet {
  build() {
    Column() {
      Grid() {
        ForEach([1,2], (day: string) => {
          ForEach([1,2,3,4,5], (day: string) => {
            GridItem() {
              Column() {
                Image($r("app.media.mine_accompaniment"))
                  .width('32vp')
                  .height('32vp')
                  .objectFit(ImageFit.Contain);

                Text('我的伴奏')
                  .fontSize('16fp')
                  .fontColor('#000000')

              }
              .width('100%')
              .height('98vp')

            }
          }, day => day)
        }, day => day)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      // .columnsGap(10)
      // .rowsGap(10)
      .height('196vp')
    }
    .width('100%')
    .backgroundColor('#FFFFFF')
  }
}