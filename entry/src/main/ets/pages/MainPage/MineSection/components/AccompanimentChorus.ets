@Component
export struct AccompanimentChorus {
  build() {
    Column() {
      Row() {
        Text('上传伴奏')
          .fontSize('16fp')
          .fontColor('#222222')

        Text('你可以到kg.qq.com上传自己的伴奏哦')
          .fontColor('#505050')
          .fontSize('12fp')
      }
      .width('100%')
      .height('53vp')
      .justifyContent(FlexAlign.SpaceBetween)
      .border({
        width: {
          bottom: '1vp'
        },
        color: '#f0f0f0'
      })

      Text('合唱')
        .height('54vp')
        .width('100%')
        .fontSize('16fp')
        .fontColor('#222222')


    }
    .width('100%')
    .height('100%')
    .padding({left: '6vp', right: '6vp'})
  }
}