import router from '@ohos.router';
import RoutersConst from '../../../../common/constants/RoutersConst';

@Component
export struct NavTagSet {
  @State tagSet: Array<Array<any>> = [
    [
      {icon: $r("app.media.mine_accompaniment"), iconDesc: '我的伴奏', iconUrl: RoutersConst.MINE_ACCOMPANIMENT_URL},
      {icon: $r("app.media.mine_local_record"), iconDesc: '本地录音', iconUrl: RoutersConst.MINE_LOCAL_RECORD_URL},
      {icon: $r("app.media.mine_vip"), iconDesc: '我的VIP', iconUrl: ''},
      {icon: $r("app.media.mine_k_coin"), iconDesc: 'K币账户', iconUrl: RoutersConst.MINE_KCOIN_ACCOUNT_URL},
    ],
    [
      {icon: $r("app.media.mine_collect"), iconDesc: '我的收藏', iconUrl: RoutersConst.MINE_SONG_COLLECTION_URL},
      {icon: $r("app.media.mine_download"), iconDesc: '本地下载', iconUrl: ''},
      {icon: $r("app.media.mine_transpond"), iconDesc: '我的转发', iconUrl: ''},
      {icon: $r("app.media.mine_more"), iconDesc: '更多', iconUrl: ''},
    ]
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
      Grid() {
        ForEach(this.tagSet, (rowItem: Array<any>) => {
          ForEach(rowItem, (colItem: any) => {
            GridItem() {
              Column() {
                Image(colItem.icon)
                  .width('32vp')
                  .height('32vp')
                  .objectFit(ImageFit.Contain);

                Text(colItem.iconDesc)
                  .height('28vp')
                  .fontSize('14fp')
                  .fontColor('#222222')

              }
              .width('100%')
              .height('98vp')
              .padding({
                top: '20vp',
                bottom: '16vp'
              })
              .onClick(() => {
                this.onJumpClick(colItem.iconUrl)
              })

            }
          }, (colItem: any, index?: number) => index + JSON.stringify(colItem))
        }, (rowItem: any, index?: number) => index + JSON.stringify(rowItem))
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .height('196vp')
    }
    .width('100%')
    .margin({bottom: '12vp'})
    .backgroundColor('#FFFFFF')
  }
}