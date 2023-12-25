import { CssConst } from '../../../../common/constants/CssConst';
@Component
export struct HistoryList {
  @Link searchArr: Array<string>;
  // ['发扣扣','体温','哦辛苦','lx','开心','理论学科','海思科','海鲜','嘎了1','实打实','海鲜','嘎了','实打实']

  @Builder SearchList() {
    List() {
      if (this.searchArr.length > 0) {
        ForEach(this.searchArr,
          (item: any, index?: number) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize('18fp')
                .fontColor('#222222')

              Blank()
              Image($r('app.media.ic_delete'))
                .width(20)
                .height(20)
                .onClick(() => {
                  this.searchArr.splice(index, 1);
                })
            }
            .width('100%')
            .height(40)
            .justifyContent(FlexAlign.Center)
          }
        }, (item: any, index?: number) => index + JSON.stringify(item))
      }
    }
    .padding({
      left: '14vp',
      right: '14vp'
    })
    // .height(200)
  }

  build() {
    Column() {
      Flex({ alignItems: ItemAlign.Center }) {
        if (this.searchArr.length > 0) {
          Text('历史搜索列表')
            .fontSize('20fp')
            .fontColor('#182431')
            .fontWeight(500)
            .height('20vp')
            .layoutWeight(8)
            .margin({left: '12vp'})

          Image($r('app.media.ic_clean'))
            .height('20vp')
            .width('20vp')
            .margin({ right: '12vp' })
            .onClick(() => {
              this.searchArr.splice(0, this.searchArr.length);
              this.searchArr.length = 0;
            })
        } else {
          Column() {
            Image($r('app.media.ic_no_search'))
              .height('15%')
              .width('33.3%')
              .margin({
                top: '180vp',
                bottom: '10vp'
              })

            Text('没有搜索内容')
              .fontSize('16fp')
              .fontColor('#99182431')
              .height('15%')
              .width('33.3%')
          }
          .width(CssConst.THOUSANDTH_1000)
          .justifyContent(FlexAlign.Center)
        }
      }
      .padding({bottom: '10vp'})

      this.SearchList()
    }
    .width('100%')

    .layoutWeight(1)
    .margin({bottom: 50})
    .alignItems(HorizontalAlign.Start)
  }
}function $searchArr($searchArr: any,arg1: (item: any,index?: number) => void,arg2: (item: any,index?: number) => string) {
throw new Error('Function not implemented.');
}
