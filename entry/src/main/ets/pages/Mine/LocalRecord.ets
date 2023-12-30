@Entry
@Component
struct LocalRecord {
  private recordList: Array<any> = [
    {
      recordName: '小拳拳锤你（说唱版）',
      recordSinger: '',
      recordFileSize: ' 0.21MB',
      recordDate: ' 06-28  17:13',
      recordTags: [
        {tagName: '清唱', color: '#ffe599'},
        {tagName: 'HQ', color: '#01c101'}
      ]
    },
    {
      recordName: '日不落',
      recordSinger: '蔡依林',
      recordFileSize: ' 5.21MB',
      recordDate: ' 12-28  22:26',
      recordTags: [
        {tagName: '说唱', color: '#ff9900'},
        {tagName: 'HQ', color: '#01c101'},
        {tagName: 'MV', color: '#ff5050'}
      ]
    },
    {
      recordName: '童话',
      recordSinger: '光良',
      recordFileSize: ' 6.67MB',
      recordDate: ' 12-29  09:26',
      recordTags: [
        {tagName: 'MV', color: '#ff5050'}
      ]
    }
  ]

  @Builder TagBuilder(tagName: string, color: string) {
    Text(tagName)
      .height('20vp')
      .padding({left: '4vp', right: '4vp'})
      .margin({left: '8vp'})
      .fontSize('12fp')
      .fontColor(color)
      .border({
        width: '1vp',
        color: color,
        radius: '5vp'
      })
  }

  @Builder RecordItem(item: any) {
    Row() {
      Column() {
        Row() {
          // 文本省略号
          Text(`${item.recordName}`.split('').join('\u200B'))
            .height('20vp')
            .constraintSize({maxWidth: '80%'})
            .padding({left: '2vp'})
            .fontSize('14fp')
            .fontColor('#222222')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)

          if (item.recordSinger) {
            Text(item.recordSinger)
              .height('20vp')
              .margin({left: '4vp'})
              .fontSize('12fp')
              .fontColor('#808080')
          }

          if (item.recordTags) {
            ForEach(item.recordTags, (tagItem: any) =>  {
              this.TagBuilder(tagItem.tagName, tagItem.color)
            }, (item: any, index?: number) => index + JSON.stringify(item))
          }
        }

        Row() {
          Text(item.recordDate)
            .height('15vp')
            .margin({right: '2vp'})
            .fontSize('12fp')
            .fontColor('#333333')

          Text(item.recordFileSize)
            .height('15vp')
            .fontSize('12fp')
            .fontColor('#333333')
        }
      }
      .flexGrow(1)
      .alignItems(HorizontalAlign.Start)

      Button('发布', { type: ButtonType.Capsule, stateEffect: true })
        .width('50vp')
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
    .width('100%')
    .height('58vp')
    .padding({left: '10vp', right: '5vp'})
    .border({
      width: {
        bottom: '1vp'
      },
      color: '#f0f0f0'
    })
  }

  build() {
    Column() {
      Column() {
        ForEach(this.recordList, (item: any) =>  {
          this.RecordItem(item)
        }, (item: any, index?: number) => index + JSON.stringify(item))
      }
      .height('100%')
      .padding({left: '10vp', right: '10vp', top: '12vp', bottom: '8vp'})
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .margin({bottom: '20vp'})
    .backgroundColor('#ffffff')
  }
}