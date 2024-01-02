@Component
export struct PersonalDynamics {
  build() {
    Column() {
      Row() {
        Image($r('app.media.mine_avatar'))
          .width('47vp')
          .height('47vp')
          .margin({right: '8vp'})
          .borderRadius('50vp')

        Column() {
          Text('Xiaopiu')
            .height('23vp')
            .fontSize('16fp')
            .fontColor('#222222')

          Text('06月18日20:27')
            .height('23vp')
            .fontSize('12fp')
            .fontColor('#505050')
        }
        .alignItems(HorizontalAlign.Start)
        .flexGrow(1)

        Image($r('app.media.ic_delete'))
          .width('23vp')
          .height('23vp')
          .margin({right: '4vp'})
      }
      .padding({top: '18vp'})
      .width('100%')

      Text('当然是要选择原谅他！')
        .width('100%')
        .padding({top: '10vp', bottom: '10vp'})
        .fontSize('15fp')
        .fontColor('#222222')

      Row() {
        Stack({ }) {
          Image($r('app.media.mine_song_bg'))
            .width('111vp')
            .height('111vp')

          Column(){}.width('100%').height('100%').backgroundColor('#a2c4c9').opacity(0.7)
          Image($r('app.media.mine_song_record')).width('47vp').height('47vp')
          Image($r('app.media.mine_song_play'))
            .width('36vp')
            .height('36vp')
            .translate({
              x: '32vp',
              y: '28vp'
            })
        }
        .width('111vp')
        .height('111vp')
        // .backgroundImage(
        //   $r('app.media.mine_song_bg'),
        //   ImageRepeat.NoRepeat
        // )
        // .backgroundImageSize({
        //   width: '111vp',
        //   height: '111vp'
        // })

        Column() {
          Row() {
            Text('当然是选择原谅他')
              .height('27vp')
              .fontSize('15fp')
              .fontColor('#000000')


            Text('清唱')
              .padding({left: '4vp', right: '4vp'})
              .margin({left: '6vp'})
              .border({
                width: '1vp',
                color: '#ff9900'
              })
              .fontSize('12')
              .fontColor('#ff9900')
              .lineHeight('16vp')
              .borderRadius('4vp')
          }

          Text('5收听')
            .fontSize('12fp')
            .fontColor('#505050')
            .lineHeight('21vp')
        }
        .alignItems(HorizontalAlign.Start)
        .padding({left: '16vp'})
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .height('111vp')
      .backgroundColor('#f0f0f0')

      Flex() {
        Row() {
          Image($r('app.media.mine_gifts'))
            .width('23vp')
            .height('23vp')
            .margin({right: '4vp'})
          Text('送礼')
            .fontSize('14fp')
        }
        .height('100%')
        .flexGrow(1)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)

        Row() {
          Image($r('app.media.mine_comment'))
            .width('23vp')
            .height('23vp')
            .margin({right: '4vp'})
          Text('评论')
            .fontSize('14fp')
        }
        .height('100%')
        .flexGrow(1)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)

        Row() {
          Image($r('app.media.mine_transpond_dynamics'))
            .width('23vp')
            .height('23vp')
            .margin({right: '4vp'})
          Text('转发')
            .fontSize('14fp')
            .fontColor('#505050')
        }
        .height('100%')
        .flexGrow(1)
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }
      .height('52vp')


    }
    .width('100%')
    .height('100%')
    .padding({left: '6vp', right: '6vp'})

  }
}