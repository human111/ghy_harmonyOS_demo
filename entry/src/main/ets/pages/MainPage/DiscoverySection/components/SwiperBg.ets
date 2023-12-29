class MyDataSource implements IDataSource {
  private list: Resource[] = []
  private listener: DataChangeListener

  constructor(list: Resource[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): Resource {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Component
export struct SwiperBg {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list = [
      $r('app.media.mine_song_2'),
      $r('app.media.mine_song_3'),
      $r('app.media.discovery_singer_2'),
      $r('app.media.discovery_singer_8'),
      $r('app.media.discovery_singer_1'),
    ]
    this.data = new MyDataSource(list)
  }

  build() {
    Column() {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: Resource) => {
          Image(item)
            .width('100%')
            .height('140vp')
        }, item => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(3000)
      .indicator(true)
      .loop(true)
      .duration(400)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })

    }.width('100%').backgroundColor(Color.Orange)
  }
}