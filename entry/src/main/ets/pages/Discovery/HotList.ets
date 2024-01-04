import router from '@ohos.router'
import RoutersConst from '../../common/constants/RoutersConst'
@Entry
@Component
struct HotList {
  @State songList: Array<any> = [
    {
      avatar: $r('app.media.ghy_singer_4'),
      name: '萤火飞光不良人',
      recommendDesc: '90后青春岁月里，我们曾抄写过的歌词',
    },
    {
      avatar: $r('app.media.ghy_singer_2'),
      name: '百川归海',
      recommendDesc: '校园时代 · 或许你抄过他的歌词',
    },
    {
      avatar: $r('app.media.ghy_singer_5'),
      name: '帅气捕梦记',
      recommendDesc: '抖音热歌：单曲循环不切歌',
    },
    {
      avatar: $r('app.media.ghy_singer_8'),
      name: '离职已过万重山',
      recommendDesc: '舒压轻音：安静听风，将疲惫暂缓',
    },
    {
      avatar: $r('app.media.ghy_singer_9'),
      name: '明天有梦',
      recommendDesc: '一口气全听完！每首都是宝藏歌曲',
    },
    {
      avatar: $r('app.media.ghy_singer_7'),
      name: '下一秒',
      recommendDesc: '深夜emo神曲:哪首是你心中的No.1',
    }
  ]

  build() {
    Column() {
      Column() {
        GridRow({
          columns: 2,
          gutter: { x: 10, y: 10 },
          direction: GridRowDirection.Row
        }) {
          ForEach(this.songList, (contestItem) => {
            GridCol() {
              Column() {
                Image(contestItem.avatar)
                  .width('100%')
                  .height('130vp')

                Column() {
                  Text(contestItem.name)
                    .height('20vp')
                    .margin({bottom: '2vp'})
                    .fontWeight(500)
                    .fontColor('#222222')
                    .fontSize('14fp')

                  Text(contestItem.recommendDesc)
                    .lineHeight('16vp')
                    .textOverflow({overflow: TextOverflow.None})
                    .fontSize('12fp')
                    .fontColor('#666666')
                }
                .width('100%')
                .padding({top: '8vp', right: '10vp', bottom: '8vp', left: '10vp'})
                .alignItems(HorizontalAlign.Start)
              }
              .borderRadius('8vp')
              .backgroundColor('#FFFFFF')
              .clip(true)
              .onClick(() => {
                router.pushUrl({
                  url: RoutersConst.DISCOVERY_HOT_LIST_DETAIL_URL // 目标url
                }, router.RouterMode.Standard, (err) => {
                  if (err) {
                    console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                    return;
                  }
                  console.info('Invoke pushUrl succeeded.');
                });
              })
            }
          })
        }.width("100%").height("100%")
      }
      .width('100%')
      .padding({top: '12vp', right: '15vp', left: '15vp'})

    }
    .height('100%')
    .backgroundColor('#f4f4f4')
  }
}