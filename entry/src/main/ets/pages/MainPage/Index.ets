
import { CssConst } from '../../common/constants/CssConst';
import { TabId } from '../../common/constants/EnumDefine';
import { HomeSection } from './HomeSection';
import { MessageSection } from './MessageSection';
import { MineSection } from './MineSection';
import { NavList } from './models/model/NavModel';

// 通用样式
@Styles function allSize() {
  .width(CssConst.THOUSANDTH_1000)
  .height(CssConst.THOUSANDTH_1000)
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State currentTab: number = 4;

  private tabController: TabsController = new TabsController();


  @Builder TabBuilder(index: number) {
    Column() {
      Image(index === this.currentTab ? NavList[index].icon_selected : NavList[index].icon)
        .width('26vp')
        .height('26vp')
        .objectFit(ImageFit.Contain);
      Text(NavList[index].text)
        .fontSize('12fp')
        .fontWeight(CssConst.FONT_WEIGHT_500)
        .fontColor(this.currentTab === index ? '#ff5050' : $r('app.color.tabTitleColor'))
        .margin({ top: $r('app.float.default_4') })
    }
    .justifyContent(FlexAlign.Center)
    .allSize()
  }

  @Builder TabBuilder1(index: number) {
    Flex({
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center
    }) {
      Image(NavList[index].icon_selected)
        .width('52vp')
        .height('52vp')
        .objectFit(ImageFit.Contain)
        .backgroundColor('#ff5050')
        .borderRadius('26vp')
    }
    .allSize()
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController, index: 3 }) {
      TabContent() {
        HomeSection()
      }
      .tabBar(this.TabBuilder(TabId.DYNAMIC))

      TabContent() {
        Text('ddd')
      }
      .tabBar(this.TabBuilder(TabId.DISCOVERY))

      TabContent() {
        Text('ddd')
      }
      .tabBar(this.TabBuilder1(TabId.RECORD))

      TabContent() {
        MessageSection()
      }
      .tabBar(this.TabBuilder(TabId.MESSAGE))
      .backgroundColor('#f0f0f0')

      TabContent() {
        MineSection()
      }
      .tabBar(this.TabBuilder(TabId.MINE))
      .backgroundColor('#f0f0f0')
    }
    .scrollable(false)
    .allSize()
    .barWidth(CssConst.THOUSANDTH_940)
    .barMode(BarMode.Fixed)
    .vertical(false)
    .onChange((index) => {
      this.currentTab = index;
    })
  }
}