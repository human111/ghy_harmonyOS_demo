@Component
export struct MineHeader {
  @Builder InfoItem(num: string, typeName: string) {
    Column() {
      Text(num)
        .height('40vp')
        .align(Alignment.Bottom)
        .padding({bottom: '6vp'})
        .fontSize('18fp')

      Text(typeName)
        .height('32vp')
        .align(Alignment.Top)
        .fontSize('12fp')
        .fontColor('#505050')

    }
    .width('80vp')
  }

  build() {
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
          Image($r('app.media.mine_avatar'))
            .width('98vp')
            .height('98vp')
            .margin({right: '14vp'})
            .translate({y: '49vp', z: 100})
            .borderRadius(50)
            .objectFit(ImageFit.Contain);

          Text('Guohongyu')
            .height('50vp')
            .margin({right: '10vp'})
            .fontWeight(FontWeight.Bold)
            .fontSize('20fp')
            .fontColor('#FFFFFF')
            .alignSelf(ItemAlign.End)

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
          .height('50vp')
          .alignSelf(ItemAlign.End)

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
      .zIndex(999)


      Column() {
        Row() {
          this.InfoItem('999', '粉丝')
          Divider().vertical(true).height('52vp').color('#f0f0f0')
          this.InfoItem('10', '关注')
          Divider().vertical(true).height('52vp').color('#f0f0f0')
          this.InfoItem('66', '好友')
        }
        .justifyContent(FlexAlign.End)
        .width('100%')
        .height('72vp')
        .padding({
          right: '6vp'
        })

        Divider().strokeWidth(1).color('#f0f0f0')

        Row() {
          Column() {
            Row() {
              Text('等级')
                .constraintSize({minWidth: '40vp'})
                .margin({right: '20vp'})
                .fontSize('16fp')
                .fontColor('#505050')
                .lineHeight('131%')

              Row() {
                Image($r('app.media.mine_arrow_1'))
                  .width('20vp')
                  .height('20vp')
                  .rotate({angle: 90})
                  .objectFit(ImageFit.Contain);
                Text('LV0')
                  .width('50vp')
                  .height('20vp')
                  .padding({
                    left: '5vp',
                    right: '5vp'
                  })
                  .fontSize('12fp')
                  .fontColor('#FFFFFF')
                  .textAlign(TextAlign.Center)
                  .borderRadius('6vp')
                  .translate({x: '-8vp'})
                  .backgroundColor('#980000');
              }
            }
            .margin({bottom: '10vp'})

            Row() {
              Text('签名')
                .constraintSize({minWidth: '40vp'})
                .margin({right: '20vp'})
                .fontSize('16fp')
                .fontColor('#505050')
                .lineHeight('131%')

              Text('点击设置自己的个性签名')
                .margin({right: '20vp'})
                .fontSize('16fp')
                .fontColor('#505050')
                .fontFamily('PingFang SC')
                .lineHeight('131%')
                .layoutWeight(1)

              Image($r('app.media.mine_right'))
                .width('22vp')
                .height('22vp')
                .objectFit(ImageFit.Contain);
            }
            .margin({bottom: '10vp'})

            Row() {
              Text('资料')
                .constraintSize({minWidth: '40vp'})
                .margin({right: '20vp'})
                .fontSize('16fp')
                .fontColor('#505050')
                .lineHeight('131%')

              Image($r('app.media.mine_sex_y'))
                .width('22vp')
                .height('22vp')
                .margin({right: '10vp'})
                .objectFit(ImageFit.Contain);

              Text('北京 朝阳')
                .margin({right: '20vp'})
                .fontSize('16fp')
                .fontColor('#505050')
                .fontFamily('PingFang SC')
                .lineHeight('131%')
                .layoutWeight(1)
            }
          }
          .width('100%')
          .margin({top: '20vp'})
          .alignItems(HorizontalAlign.Start)
          // .backgroundColor(Color.Gray)

        }
        .alignItems(VerticalAlign.Top)
        .height('108vp')
        .padding({left: '20vp', right: '20vp'})

        Row() {
          Image($r('app.media.mine_down'))
            .width('32vp')
            .height('32vp')
            .objectFit(ImageFit.Contain);
        }

      }.width('100%').backgroundColor('#FFFFFF')
    }
    .margin({bottom: '12vp'})
  }
}