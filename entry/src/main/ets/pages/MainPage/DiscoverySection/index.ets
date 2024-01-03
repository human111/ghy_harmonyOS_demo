import router from '@ohos.router'
import RoutersConst from '../../../common/constants/RoutersConst'
import { CommHotSection } from './components/CommHotSection'
import { PopularityRanking } from './components/PopularityRanking'
import { SwiperBg } from './components/SwiperBg'

@Component
export struct DiscoverySection {
  @State tagSet: Array<any> = [
    {icon: $r("app.media.discovery_megagame"), iconDesc: '大赛', iconUrl: RoutersConst.DISCOVERY_CONTEST_URL},
    {icon: $r("app.media.discovery_hot_song_menu"), iconDesc: '热门歌单', iconUrl: ''},
    {icon: $r("app.media.discovery_jury"), iconDesc: '我是评委', iconUrl: ''},
    {icon: $r("app.media.discovery_certified_singer"), iconDesc: '认证歌手', iconUrl: ''},
  ]

  @State hotCardList: Array<any> = [
    {
      title: '热门直播',
      subTitle: '精彩进行时',
      buttonName: '全部',
      singerList: [
        {
          singerImg: $r('app.media.discovery_singer_6'),
          songName: '歌手伦桑',
          songDesc: '',
          audienceNum: 72443
        },
        {
          singerImg: $r('app.media.discovery_singer_7'),
          songName: '天真',
          songDesc: '',
          audienceNum: 3234
        },
        {
          singerImg: $r('app.media.discovery_singer_3'),
          songName: 'mc天佑',
          songDesc: '',
          audienceNum: 87898
        }
      ]
    },
    {
      title: '热门作品',
      subTitle: '',
      buttonName: '',
      singerList: [
        {
          singerImg: $r('app.media.discovery_singer_6'),
          songName: '我的道姑朋友',
          songDesc: '歌手伦桑',
          audienceNum: ''
        },
        {
          singerImg: $r('app.media.discovery_singer_3'),
          songName: '童话镇',
          songDesc: '东木',
          audienceNum: ''
        },
        {
          singerImg: $r('app.media.discovery_singer_4'),
          songName: '游戏万岁',
          songDesc: '歌手伦桑',
          audienceNum: ''
        }
      ]
    },
    {
      title: '热门歌单',
      subTitle: '致爱听歌的你',
      buttonName: '全部',
      singerList: [
        {
          singerImg: $r('app.media.discovery_singer_5'),
          songName: '二次元✖️古风',
          songDesc: '让你跪着听歌',
          audienceNum: ''
        },
        {
          singerImg: $r('app.media.discovery_singer_7'),
          songName: '父爱',
          songDesc: '愿岁月长流',
          audienceNum: ''
        },
        {
          singerImg: $r('app.media.discovery_singer_3'),
          songName: '喊麦躁起来',
          songDesc: '领略喊麦魅力',
          audienceNum: ''
        }
      ]
    },
    {
      title: '认证歌手专区',
      subTitle: '',
      buttonName: '全部',
      singerList: [
        {
          singerImg: $r('app.media.user_0'),
          songName: '歌手伦桑',
          songDesc: '',
          audienceNum: 66687
        },
        {
          singerImg: $r('app.media.mine_song_bg'),
          songName: '伦桑全新专辑',
          songDesc: '每首歌都让你怀孕',
          audienceNum: ''
        },
        {
          singerImg: $r('app.media.mine_song_1'),
          songName: '实力合唱',
          songDesc: '不服来战！',
          audienceNum: ''
        }
      ]
    }
  ]

  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  onJumpClick(url: string): void {
    if (url) {
      router.pushUrl({
        url: url // 目标url
      }, router.RouterMode.Standard, (err) => {
        if (err) {
          console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('Invoke pushUrl succeeded.');
      });
    }
  }

  build() {
    Column() {
      Stack({alignContent: Alignment.End}) {
        Text('发现')
          .fontSize('16fp')
          .fontColor('#ffffff')
          .textAlign(TextAlign.Center)
          .width('100%')
          .height('44vp')
          .backgroundColor('#ff5050')

        Image($r('app.media.discovery_add_friend'))
          .width('25vp')
          .height('25vp')
          .margin({right: '10vp'})
          .onClick(() => {
            this.onJumpClick(RoutersConst.DISCOVERY_SEARCH_USER_URL)
          })
      }

      Scroll() {
        Column() {
          SwiperBg()

          Grid() {
            ForEach(this.tagSet, (rowItem: any) => {
              GridItem() {
                Column() {
                  Image(rowItem.icon)
                    .width('25vp')
                    .height('25vp')
                    .objectFit(ImageFit.Contain);

                  Text(rowItem.iconDesc)
                    .height('20vp')
                    .margin({top: '2vp'})
                    .fontSize('14fp')
                    .fontColor('#222222')

                }
                .width('100%')
                .height('100%')
                .justifyContent(FlexAlign.Center)
                .onClick(() => {
                  this.onJumpClick(rowItem.iconUrl)
                })

              }
            }, (rowItem: any, index?: number) => index + JSON.stringify(rowItem))
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .height('60vp')
          .margin({bottom: '10vp'})
          .backgroundColor('#ffffff')

          ForEach(this.hotCardList, (item: any, index: number) =>  {
            CommHotSection({commData: JSON.stringify(item)})
          }, (item: any, index?: number) => index + JSON.stringify(item))

          PopularityRanking()

        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical)  // 滚动方向纵向
      .edgeEffect(EdgeEffect.None)
    }.height('100%').padding({bottom: '52vp'})
  }
}