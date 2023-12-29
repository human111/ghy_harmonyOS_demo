@Component
export struct CommHotSection {
  @Prop commData: string;
  private localCommData: any;

  aboutToAppear(): void {
    this.localCommData = JSON.parse(this.commData)
    console.log('===d=g===', this.localCommData )
  }

  build() {
    Column() {
      Row() {
        Row() {
          Text(this.localCommData.title)
            .fontSize('16fp')
            .fontColor('#222222')
            .margin({right: '10vp'})

          if (this.localCommData.subTitle) {
            Text(this.localCommData.subTitle)
              .fontSize('12fp')
              .fontColor('#505050')
          }
        }

        if (this.localCommData.buttonName) {
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
      }
      .width('100%')
      .height('44vp')
      .justifyContent(FlexAlign.SpaceBetween)

      Flex({justifyContent: FlexAlign.SpaceBetween}) {
        ForEach(this.localCommData.singerList || [], (item: any, index: number) =>  {
          Column() {
            Image(item.singerImg)
              .height('90vp')
              .width('90vp')

            Text(item.songName)
              .padding({top: '4vp', bottom: '4vp'})
              .fontSize('14fp')
              .fontColor('#222222')

            if (item.songDesc) {
              Text(item.songDesc)
                .fontSize('12fp')
                .fontColor('#505050')
                .margin({right: '4vp'})
                .height('15vp')
            }

            if (item.audienceNum) {
              Row() {
                Image($r('app.media.discovery_population'))
                  .width('15vp')
                  .height('15vp')
                  .margin({right: '2vp'})

                Text(`${item.audienceNum}`)
                  .fontSize('12fp')
                  .fontColor('#505050')
                  .margin({right: '4vp'})
                  .height('15vp')
              }
            }

          }
          .alignItems(HorizontalAlign.Start)
        }, (item: any, index?: number) => index + JSON.stringify(item))

      }
      .width('100%')

    }
    .width('100%')
    .padding({"top":"0.00px","right":"10.00vp","bottom":"14.00vp","left":"10.00vp"})
    .margin({bottom: '10vp'})
    .backgroundColor('#ffffff')
  }
}