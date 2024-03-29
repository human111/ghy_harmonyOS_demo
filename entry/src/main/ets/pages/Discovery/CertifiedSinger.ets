import { searchTagsData, singerListData, singers } from './DiscoveryDataSource'

@Entry
@Component
struct CertifiedSinger {
  @State searchTagsList: Array<any> = []
  private mockSearchTagsData: any = searchTagsData
  // private mockSingerListData: any = singerListData.slice(0,20)
  private scroller: Scroller = new Scroller()

  private singersArr: any[] = singers.slice(0,4)


  aboutToAppear() {
    for (var key in this.mockSearchTagsData) {
      if (key !== 'index') {
        this.searchTagsList.push(this.mockSearchTagsData[key])
      }
    }
  }

  @Builder SearchConditionItem(conditionItem: any) {
    Row() {
      Scroll() {
        Row() {
          ForEach(conditionItem, (item: any) =>  {
            Text(item.name)
              .height('26vp')
              .constraintSize({minWidth: '40vp'})
              .padding({left: '8vp', right: '8vp'})
              .margin({right: '12vp'})
              .fontSize('12vp')
              .fontColor(item.id == -100 ? '#FFFFFF': '#222222')
              .textAlign(TextAlign.Center)
              .borderRadius('13vp')
              .backgroundColor(item.id == -100 ? '#31c27c' : '#FFFFFF')
          }, (item: any, index?: number) => index + JSON.stringify(item))
        }
        .padding({left: '10vp', bottom: '14vp'})
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBarWidth(0)
    }
    .width('100%')
  }

  @Builder SingerItem(singer: any) {
    Column() {
      if (singer.title !== '热') {
        Text(singer.title)
          .fontSize('14fp')
          .fontColor('#222222')
          .width('100%')
          .padding({bottom: '12vp'})
      }

      ForEach(singer.list, (singerItem: any) =>  {
        Row(){
          Row() {
            Image(singerItem.pic)
              .width('40vp')
              .height('40vp')
              .borderRadius('20vp')
              .margin({right: '10vp'})

            Text(singerItem.name)
              .fontSize('14fp')
              .fontColor('#222222')
          }

          Button() {
            Row() {
              Image($r('app.media.discovery_add')).width('12vp').height('12vp').margin({right: '2vp'})
              Text('关注').fontSize('10fp').fontColor('#222222')
            }
          }.type(ButtonType.Capsule)
          .width('50vp')
          .height('20vp')
          .padding(0)
          .backgroundColor('#FFFFFF')
          .border({
            width: '1vp',
            color: '#cccccc'
          })
          .onClick(()=>{})
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .padding({bottom: '12vp'})
      }, (item: any, index?: number) => index + JSON.stringify(item))

    }
      .width('100%')
      .padding({left: '10vp', right: '10vp'})
      .id(singer.title)
  }


  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          ForEach(this.searchTagsList, (item: any) =>  {
            this.SearchConditionItem(item)
          }, (item: any, index?: number) => index + JSON.stringify(item))

          ForEach(this.singersArr, (item: any) =>  {
            this.SingerItem(item)
          }, (item: any, index?: number) => index + JSON.stringify(item))
        }
        .width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .edgeEffect(EdgeEffect.None)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info('onScroll: ', xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge: ', side)
        console.info('getInspectorByKey: ', getInspectorByKey("热"))
      })
    }
    .width('100%')
    .height('100%')
    .padding({top: '20vp'})
    .backgroundColor('#F1F4F6')
  }
}