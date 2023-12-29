@Component
export struct PopularityRanking {
  private rankingList: Array<any> = [
    {
      singerName: 'Xiaopiu',
      singerImg: $r('app.media.mine_avatar'),
      songName: '演员'
    },
    {
      singerName: '鲸鱼🐳',
      singerImg: $r('app.media.user_0'),
      songName: '我的一个道姑朋友'
    },
    {
      singerName: '💗 哈哈哈哈',
      singerImg: $r('app.media.discovery_singer_3'),
      songName: '当然是选择原谅他'
    }
  ]

  build() {
    Column() {
      Row() {
        Text('人气榜')
          .fontSize('16fp')
          .fontColor('#222222')
          .margin({right: '10vp'})

        Row() {
          Text('全部')
            .fontColor('#505050')
            .fontSize('12fp')

          Image($r('app.media.discovery_right'))
            .height('20vp')
            .width('20vp')
            .margin({bottom: '1vp'})
        }
      }
      .width('100%')
      .height('44vp')
      .justifyContent(FlexAlign.SpaceBetween)

      ForEach(this.rankingList, (item: any, index: number) =>  {
        Row() {
          Image(item.singerImg)
            .width('35vp')
            .height('35vp')
            .margin({right: '8vp', left: '5vp'})
            .borderRadius('50vp')

          Column() {
            Text(item.singerName)
              .height('20vp')
              .fontSize('14fp')
              .fontColor('#222222')

            Row() {
              Image($r('app.media.discovery_music'))
                .width('15vp')
                .height('15vp')
                .margin({right: '2vp'})

              Text(item.songName)
                .height('15vp')
                .fontSize('12fp')
                .fontColor('#505050')
            }

          }
          .alignItems(HorizontalAlign.Start)
          .flexGrow(1)
          .padding({bottom: '5vp'})
          .border({
            width: {
              bottom: '1vp'
            },
            color: '#f0f0f0'
          })

        }
        .width('100%')
        .padding({right: '8vp', bottom: '10vp'})
      }, (item: any, index?: number) => index + JSON.stringify(item))

    }
    .width('100%')
    .padding({"right":"10.00vp","bottom":"4.00vp","left":"10.00vp"})
    .backgroundColor('#ffffff')
  }
}