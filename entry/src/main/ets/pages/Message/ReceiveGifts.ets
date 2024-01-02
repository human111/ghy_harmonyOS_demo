@Entry
@Component
struct ReceiveGifts {
  build() {
    Column() {
      Row() {
        Row() {
          Image($r('app.media.discovery_flower'))
            .height('20vp')
            .width('20vp')
            .margin({right: '8vp'})

          Text('可兑换鲜花').fontSize('12fp').fontColor('#222222').margin({right: '10vp'})
          Text('6').fontSize('12fp').fontColor('#ff5050')
        }
        .flexGrow(1)

        Text('兑换鲜花')
          .height('24vp')
          .width('80vp')
          .fontSize('12fp')
          .fontColor('#FFFFFF')
          .textAlign(TextAlign.Center)
          .borderRadius('16vp')
          .backgroundColor('#ff5050')
      }
      .width('100%')
      .padding({top: '10vp', right: '15vp', bottom: '10vp', left: '15vp'})
      .margin({bottom: '10vp'})
      .backgroundColor('#FFFFFF')
      .border({
        width: {
          bottom: '1vp'
        },
        color: '#f0f0f0'
      })

      List() {
        ForEach([1,2,3,4,5,6,7,8,9], (item) => {
          ListItem() {
            Row() {
              Image($r('app.media.mine_avatar'))
                .width('30vp')
                .height('30vp')
                .margin({right: '10vp'})
                .borderRadius('50vp')

              Column() {
                Row() {
                  // 文本省略号
                  Text('嗷嗷嗷疯狂啦放假啊饭卡觉得分开克己复礼卡觉得放假啊疯了看看决定放手了'.split('').join('\u200B'))
                    .height('20vp')
                    .constraintSize({maxWidth: '80vp'})
                    .margin({right: '8vp'})
                    .fontSize('12fp')
                    .fontColor('#222222')
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)

                  Text('评论了：ghy')
                    .height('20vp')
                    .fontSize('12fp')
                    .fontColor('#505050')
                }

                Text('唱的好棒！喜欢！')
                  .height('20vp')
                  .fontSize('14fp')
                  .fontColor('#222222')
                  .margin({bottom: '8vp'})

                Row() {
                  Text('2023-12-26')
                    .fontColor('#505050')
                    .fontSize('12fp')

                  Row() {
                    Image($r('app.media.message_reply'))
                      .width('15vp')
                      .height('15vp')
                      .margin({right: '4vp'})

                    Text('回复')
                      .fontSize('12fp')
                      .fontColor('#505050')
                  }
                  .padding({right: '4vp'})

                }
                .width('88%')
                .height('20vp')
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .flexGrow(1)
              .alignItems(HorizontalAlign.Start)
            }
            .alignItems(VerticalAlign.Top)
            .padding({top: '10vp', right: '15vp', bottom: '10vp', left: '15vp'})
            .margin({right: '10vp', bottom: '10vp', left: '10vp'})
            .borderRadius('10vp')
            .backgroundColor('#FFFFFF')
          }
        }, item => item)
      }
      .width('100%')
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .layoutWeight(1)

    }
    .height('100%')
    .backgroundColor('#f4f4f4')
  }
}