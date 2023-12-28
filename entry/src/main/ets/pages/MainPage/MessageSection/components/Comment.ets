@Component
export struct Comment {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

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
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column() {
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


            Row() {
              Image($r('app.media.ic_music'))
                .width('30vp')
                .height('30vp')
                .margin({right: '10vp'})
                .borderRadius('50vp')

              Column() {
                Row() {
                  // 文本省略号
                  Text('魔女斗篷'.split('').join('\u200B'))
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
                  Text('2023-12-24')
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
            .margin({bottom: '8vp'})
            .padding({left: '15vp', right: '15vp', top: '20vp', bottom: '8vp'})
            .alignItems(VerticalAlign.Top)
            .backgroundColor('#ffffff')
          }
          .height('100%')
          .alignItems(HorizontalAlign.Start)

        }.tabBar(this.TabBuilder(0, '已关注人评论'))

        TabContent() {
          Column() {
            Row() {
              Image($r('app.media.ic_good'))
                .width('30vp')
                .height('30vp')
                .margin({right: '10vp'})
                .borderRadius('50vp')

              Column() {
                Row() {
                  // 文本省略号
                  Text('QQ音乐'.split('').join('\u200B'))
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
                  Text('2023-12-28')
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


            Row() {
              Image($r('app.media.user_0'))
                .width('30vp')
                .height('30vp')
                .margin({right: '10vp'})
                .borderRadius('50vp')

              Column() {
                Row() {
                  // 文本省略号
                  Text('无尽之刃'.split('').join('\u200B'))
                    .height('20vp')
                    .constraintSize({maxWidth: '80vp'})
                    .margin({right: '8vp'})
                    .fontSize('12fp')
                    .fontColor('#222222')
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)

                  Text('评论了：乐儿为之—yj')
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
                  Text('2023-12-25')
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
            .margin({bottom: '8vp'})
            .padding({left: '15vp', right: '15vp', top: '20vp', bottom: '8vp'})
            .alignItems(VerticalAlign.Top)
            .backgroundColor('#ffffff')
          }
          .height('100%')
          .alignItems(HorizontalAlign.Start)
        }.tabBar(this.TabBuilder(1, '未关注人评论'))
      }
      .barMode(BarMode.Fixed)
      .barHeight('40vp')
      .animationDuration(100)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .margin({bottom: '20vp'})
    // .backgroundColor('#FFFFFF')
  }
}