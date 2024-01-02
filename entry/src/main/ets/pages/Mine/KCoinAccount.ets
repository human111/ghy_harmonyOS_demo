@Entry
@Component
struct KCoinAccount {
  @State currentIndex: number = 0
  private swiperController: SwiperController = new SwiperController()
  @State kCoinPay: Array<any> = [
    {
      kCoinNum: '60',
      coinType: 'K币',
      rechargeAmount: '6',
      rechargeType: 0
    },
    {
      kCoinNum: '80',
      coinType: 'K币',
      rechargeAmount: '8',
      rechargeType: 0
    },
    {
      kCoinNum: '180',
      coinType: 'K币',
      rechargeAmount: '18',
      rechargeType: 0
    },
    {
      kCoinNum: '1280',
      coinType: 'K币',
      rechargeAmount: '128',
      rechargeType: 0
    },
    {
      kCoinNum: '6660',
      coinType: 'K币',
      rechargeAmount: '666',
      rechargeType: 0
    },
    {
      kCoinNum: '8880',
      coinType: 'K币',
      rechargeAmount: '888',
      rechargeType: 0
    },
    {
      kCoinNum: '10000',
      coinType: 'K币',
      rechargeAmount: '1000',
      rechargeType: 0
    },
    {
      kCoinNum: '自定义',
      coinType: 'K币',
      rechargeAmount: '充值',
      rechargeType: 1
    }
  ]

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? '#ff5050' : '#505050')
        .fontSize('13vp')
        .lineHeight('24vp')
        .height('39vp')
      Divider()
        .width('95vp')
        .strokeWidth(1)
        .color('#ff5050')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%').backgroundColor('#FFFFFF')
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Row() {
            Image($r('app.media.mine_avatar'))
              .width('25vp')
              .height('25vp')
              .margin({right: '12vp'})

            Text('xiaopiu')
              .fontSize('14fp')
              .fontColor('#505050')

          }
          .width('100%')
          .padding({
            top: '16vp',
            right: '15vp',
            bottom: '10vp',
            left: '15vp',
          })

          Row() {
            Row() {
              Image($r('app.media.mine_kcoin'))
                .width('15vp')
                .height('15vp')
                .margin({right: '6vp'})

              Text('999')
                .fontSize('12fp')
                .fontColor('#ff5050')
                .margin({right: '6vp'})

              Image($r('app.media.mine_account_gift'))
                .width('15vp')
                .height('15vp')
                .margin({right: '6vp'})

              Text('47')
                .fontSize('12fp')
                .fontColor('#ff5050')
            }

            Row() {
              Image($r('app.media.mine_cart'))
                .width('15vp')
                .height('15vp')
                .margin({right: '6vp'})

              Text('12')
                .fontSize('12fp')
                .fontColor('#ff5050')
                .margin({right: '10vp'})

              Button('兑换鲜花', { type: ButtonType.Capsule, stateEffect: true })
                .width('60vp')
                .height('20vp')
                .padding(0)
                .fontColor('#808080')
                .fontSize('10fp')
                .border({
                  width: '1vp',
                  color: '#cccccc'
                })
                .backgroundColor('#FFFFFF')
            }

          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
          .padding({
            right: '15vp',
            bottom: '10vp',
            left: '15vp',
          })

          // TabBar
          Row() {
            Row() {
              this.TabBuilder(0, '购买K币')
            }
            .layoutWeight(1)
            .onClick(() => {
              this.currentIndex = 0
            })

            Row() {
              this.TabBuilder(1, '免费鲜花')
            }
            .layoutWeight(1)
            .onClick(() => {
              this.currentIndex = 1
            })
          }
          .width('100%')
          .margin({bottom: '10vp'})

          // TabContent
          Swiper(this.swiperController) {
            Column() {
              Column() {
                GridRow({
                  columns: 3,
                  gutter: { x: 5, y: 6 },
                  direction: GridRowDirection.Row
                }) {
                  ForEach(this.kCoinPay, (kCoinPayItem) => {
                    GridCol() {
                      Column() {
                        Text(kCoinPayItem.kCoinNum)
                          .height('33vp')
                          .fontSize('16fp')
                          .fontColor('#505050')

                        Text(kCoinPayItem.coinType)
                          .height('15vp')
                          .margin({bottom: '14vp'})
                          .fontSize('12fp')
                          .fontColor('#505050')

                        Text(`${kCoinPayItem.rechargeType === 0 ? '¥' : ''}${kCoinPayItem.rechargeAmount}`)
                          .width('60vp')
                          .height('20vp')
                          .fontSize('12fp')
                          .fontColor('#ffffff')
                          .textAlign(TextAlign.Center)
                          .backgroundColor('#ff5050')
                          .borderRadius('16vp')
                      }
                      .width("100%")
                      .height("110vp")
                      .justifyContent(FlexAlign.Center)
                      .borderRadius('5vp')
                      .backgroundColor('#ffffff')
                    }
                  })
                }.width("100%").height("100%")
              }
              .width('100%')
              .padding({left: '10vp', right: '10vp'})
            }
            .width('100%')
            .visibility(this.currentIndex === 0 ? Visibility.Visible : Visibility.None)

            Column() {
              ForEach([1,2,3], () => {
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
                .width('100%')
                .padding({left: '15vp', right: '15vp', top: '20vp', bottom: '8vp'})
                .alignItems(VerticalAlign.Top)
                .backgroundColor('#ffffff')

                Row() {
                  Divider()
                    .width('90%')
                    .strokeWidth(1)
                    .alignSelf(ItemAlign.Center)
                    .color('#f0f0f0')

                }
                .width('100%')
                .justifyContent(FlexAlign.Center)
                .backgroundColor('#ffffff')

              }, (item: any, index?: number) => index + JSON.stringify(item))
            }
            .width('100%')
            .backgroundColor('#334488')
            .visibility(this.currentIndex === 1 ? Visibility.Visible : Visibility.None)
          }
          .cachedCount(1)
          .index(this.currentIndex)
          .duration(300)
          .indicator(false)
          .curve(Curve.Linear)
          .margin({bottom: '10vp'})
          .flexShrink(0)

          Text('hgyuuuj').margin({bottom: '10vp'})

        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
      }
      .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
      .edgeEffect(EdgeEffect.None)
      .align(Alignment.Top)


    }
    .height('100%')
    .backgroundColor('#f0f0f0')
  }
}