import router from '@ohos.router';
import RoutersConst from '../../../common/constants/RoutersConst'

import { Comment } from './components/Comment'
@Component
export struct MessageSection {
  @State tagSet: Array<any> = [
    {icon: $r("app.media.message_private_letter"), iconDesc: '私信', iconUrl: RoutersConst.MESSAGE_PRIVATE_URL},
    {icon: $r("app.media.message_recent_audience"), iconDesc: '最近听众', iconUrl: RoutersConst.MESSAGE_RECENT_AUDIENCE_URL},
    {icon: $r("app.media.message_receive_presents"), iconDesc: '收到礼物', iconUrl: RoutersConst.MESSAGE_RECEIVE_GIFTS_URL},
    {icon: $r("app.media.message_sys_info"), iconDesc: '系统消息', iconUrl: ''},
  ]

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
        Text('消息')
          .fontSize('16fp')
          .fontColor('#ffffff')
          .textAlign(TextAlign.Center)
          .width('100%')
          .height('44vp')
          .backgroundColor('#ff5050')

        Image($r('app.media.message_setting'))
          .width('25vp')
          .height('25vp')
          .margin({right: '10vp'})
      }

      Grid() {
        ForEach(this.tagSet, (rowItem: any) => {
          GridItem() {
            Column() {
              Image(rowItem.icon)
                .width('35vp')
                .height('35vp')
                .objectFit(ImageFit.Contain);

              Text(rowItem.iconDesc)
                .height('20vp')
                .margin({top: '5vp'})
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
      .height('100vp')
      .backgroundColor('#ffffff')

      Row() {
        Text('#直播#快来围观土豪刷礼物')
          .flexGrow(1)
          .fontSize('16fp')
          .fontColor('#222222')
          .textAlign(TextAlign.Center)

        Text('通知')
          .padding({
            left: '14vp',
            right: '14vp',
          })
          .height('18vp')
          .fontSize('10fp')
          .fontColor('#ffffff')
          .textAlign(TextAlign.Center)
          .backgroundColor('#ff5050')
          .rotate({angle: 45})
          .translate({
            y: '-13vp',
            x: '13vp',
          })
      }
      .width('100%')
      .height('48vp')
      .margin({top: '10vp', bottom: '10vp'})
      .backgroundColor('#ffffff')
      .clip(true) // 裁剪掉 ’通知‘标签溢出的部分

      Comment()
    }
    .height('100%')

  }
}