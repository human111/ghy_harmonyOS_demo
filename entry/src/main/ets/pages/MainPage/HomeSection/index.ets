import { SearchSection } from '../SearchSection'
import { Playlist } from './components/Playlist'
import { PosterSwiper } from './components/PosterSwiper'

@Component
export struct HomeSection {
  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      TabContent() {
        Column() {
          PosterSwiper()
          Text('热门歌单')
            .height('65')
            .width('100%')
            .fontSize('20')
            .fontColor('#ffcd32')
            .textAlign(TextAlign.Center)
          Playlist()
        }
        .height('100%')
        .width('100%')
        // .backgroundColor(Color.Black)
      }
      .tabBar('推荐')

      TabContent() {
        Text('歌手').fontSize(30)
      }
      .tabBar('歌手')

      TabContent() {
        Text('排行').fontSize(30)
      }
      .tabBar('排行')

      TabContent() {
        SearchSection()
      }
      .tabBar('搜索')
    }
    .barMode(BarMode.Fixed)
  }
}