@Component
export struct MySongs {
  build() {
    Column() {
      Row() {
        Text('歌单1')
          .fontSize('16fp')
          .fontColor('#222222')

        Text('查看全部')
          .fontColor('#222222')
          .fontSize('16fp')
      }
      .width('100%')
      .height('47vp')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({bottom: '7vp'})

      Row() {
        Image($r('app.media.mine_song_1'))
          .width('70vp')
          .height('70vp')
          .margin({right: '18vp'})

        Column() {
          Text('随便唱')
            .height('24vp')
            .fontSize('15fp')
            .fontColor('#222222')

          Text('共2首')
            .fontSize('12fp')
            .fontColor('#505050')
            .lineHeight('18vp')

          Text('收藏 0   收听 0   转发 0')
            .fontSize('12fp')
            .fontColor('#505050')
            .lineHeight('18vp')
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding({bottom: '22vp'})
      .border({
        width: {
          bottom: '1vp'
        },
        color: '#f0f0f0'
      })

      Row() {
        Text('歌单')
          .fontSize('16fp')
          .fontColor('#222222')

        Row() {
          Image($r('app.media.mine_play_1'))
            .height('18vp')
            .width('18vp')
            .margin({right: '4vp'})

          Text('查看全部')
            .fontColor('#505050')
            .fontSize('16fp')
        }
      }
      .width('100%')
      .height('47vp')
      .justifyContent(FlexAlign.SpaceBetween)

      Flex({justifyContent: FlexAlign.SpaceBetween}) {
        Column() {
          Image($r('app.media.mine_song_2'))
            .height('100vp')
            .width('100vp')

          Text('凉凉')
            .padding({top: '4vp', bottom: '4vp'})
            .fontSize('14fp')
            .fontColor('#222222')

          Row() {
            Text('GGG')
              .fontSize('14fp')
              .fontColor('#ff9900')
              .margin({right: '4vp'})

            Text('收听')
              .fontSize('12fp')
              .fontColor('#222222')
              .margin({right: '8vp'})

            Text('5')
              .fontSize('12fp')
              .fontColor('#222222')
          }
          .height('23vp')
        }
        .alignItems(HorizontalAlign.Start)

        Column() {
          Image($r('app.media.mine_song_bg'))
            .height('100vp')
            .width('100vp')

          Text('sg小菜鸡')
            .padding({top: '4vp', bottom: '4vp'})
            .fontSize('14fp')
            .fontColor('#222222')

          Row() {
            Text('HHH')
              .fontSize('14fp')
              .fontColor('#ff9900')
              .margin({right: '4vp'})

            Text('收听')
              .fontSize('12fp')
              .fontColor('#222222')
              .margin({right: '8vp'})

            Text('5')
              .fontSize('12fp')
              .fontColor('#222222')
          }
          .height('23vp')
        }
        .alignItems(HorizontalAlign.Start)

        Column() {
          Image($r('app.media.mine_song_3'))
            .height('100vp')
            .width('100vp')

          Text('rose')
            .padding({top: '4vp', bottom: '4vp'})
            .fontSize('14fp')
            .fontColor('#222222')

          Row() {
            Text('YYY')
              .fontSize('14fp')
              .fontColor('#ff9900')
              .margin({right: '4vp'})

            Text('收听')
              .fontSize('12fp')
              .fontColor('#222222')
              .margin({right: '8vp'})

            Text('5')
              .fontSize('12fp')
              .fontColor('#222222')
          }
          .height('23vp')
        }
        .alignItems(HorizontalAlign.Start)

      }
      .width('100%')

      Text('已加载全部')
        .width('100%')
        .height('52vp')
        .margin({top: '14vp'})
        .fontColor('#505050')
        .fontSize('16fp')
        .textAlign(TextAlign.Center)

    }
    .width('100%')
    .height('100%')
    .padding({left: '6vp', right: '6vp'})
    // .backgroundColor('#007DFF')
  }
}