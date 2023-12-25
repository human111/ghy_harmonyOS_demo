@Component
export struct MineSection {
  build() {
    Column() {
      Scroll() {
        Column() {
          Column() {
            Row() {
              Image($r('app.media.mine_setting'))
                .width('26vp')
                .height('26vp')
                .objectFit(ImageFit.Contain);

              Blank();

              Image($r('app.media.mine_rich_scan'))
                .width('26vp')
                .height('26vp')
                .margin({right: '12vp'})
                .objectFit(ImageFit.Contain)

              Image($r('app.media.mine_share'))
                .width('26vp')
                .height('26vp')
                .objectFit(ImageFit.Contain);
            }
            .width('100%')
            .padding({
              top: '12vp',
              left: '20vp',
              right: '20vp'
            })

            Blank();

            Row() {
              // Image($r('app.media.mine_avatar'))
              //   .width('98vp')
              //   .height('98vp')
              //   .translate({y: '49vp', z: 100})
              //   .borderRadius(50)
              //   .objectFit(ImageFit.Contain);

              Text('Guohongyu')
                .height('50vp')
                .margin({right: '10vp'})
                .fontWeight(FontWeight.Bold)
                .fontSize('20fp')
                .fontColor('#FFFFFF')

              Row() {
                Image($r('app.media.mine_arrow'))
                  .width('20vp')
                  .height('20vp')
                  .rotate({angle: 90})
                  .objectFit(ImageFit.Contain);
                Text('未开通')
                  .height('20vp')
                  .padding({
                    left: '5vp',
                    right: '5vp'
                  })
                  .fontWeight(FontWeight.Bold)
                  .fontSize('12fp')
                  .fontColor('#FFFFFF')
                  .textAlign(TextAlign.Center)
                  .borderRadius('4vp')
                  .translate({x: '-8vp'})
                  .backgroundColor('#505050');
              }
            }
            .width('100%')
            .padding({
              left: '20vp',
              right: '20vp'
            })
          }
          .width('100%')
          .height('180vp')
          .backgroundColor('#ff5050')
          Column().width('100%').height('180vp').backgroundColor('#ee5050')
          // Column().width('100%').height('180vp').backgroundColor('#aa5050')
          // Column().width('100%').height('180vp').backgroundColor('#bb5050')
          // Column().width('100%').height('180vp').backgroundColor('#cc5050')
          // Column().width('100%').height('180vp').backgroundColor('#dd5050')
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}