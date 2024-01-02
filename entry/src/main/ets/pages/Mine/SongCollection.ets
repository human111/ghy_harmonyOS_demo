@Entry
@Component
struct SongCollection {
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
      }
      .padding({top: '15vp', bottom: '10vp'})
      .width('100%')

      Row() {
        Image($r('app.media.mine_song_2'))
          .width('111vp')
          .height('111vp')

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

          Text('0 评论 5 收听')
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
      .borderRadius('8vp')
      .clip(true)
      .backgroundColor('#f0f0f0')

    }
    .width('100%')
    .height('100%')
    .padding({left: '10vp', right: '10vp'})
    .backgroundColor('#FFFFFF')
  }
}