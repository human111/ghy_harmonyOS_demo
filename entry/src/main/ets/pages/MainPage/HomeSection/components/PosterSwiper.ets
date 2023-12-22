
import { PosterDataSource } from '../../models/model/SwiperPosterModel';

@Component
export struct PosterSwiper {
  private swiperController: SwiperController = new SwiperController()
  private data: PosterDataSource = new PosterDataSource([])

  aboutToAppear(): void {
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new PosterDataSource(list)
  }

  build() {
    Flex() {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item).width('90%').height(160).backgroundColor(0xAFEEEE).textAlign(TextAlign.Center).fontSize(30)
        }, item => item)
      }
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })
      .width('100%')
    }
  }
}