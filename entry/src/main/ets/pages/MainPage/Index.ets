
import { CssConst } from '../../common/constants/CssConst';
import { TabId } from '../../common/constants/EnumDefine';
import { HomeSection } from './HomeSection';
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
  @State currentTab: number = 0;

  private tabController: TabsController = new TabsController();


  @Builder TabBuilder(index: number) {
    Column() {
      Image(index === this.currentTab ? NavList[index].icon_selected : NavList[index].icon)
        .width($r('app.float.default_24'))
        .height($r('app.float.default_24'))
        .objectFit(ImageFit.Contain);
      Text(NavList[index].text)
        .fontSize($r('app.float.default_10'))
        .fontWeight(CssConst.FONT_WEIGHT_500)
        .fontColor(this.currentTab === index ? $r('app.color.blueColor') : $r('app.color.tabTitleColor'))
        .margin({ top: $r('app.float.default_4') })
    }.justifyContent(FlexAlign.Center).allSize()
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      TabContent() {
        HomeSection()
      }
      .tabBar(this.TabBuilder(TabId.HOME))
      .align(Alignment.Start)

      TabContent() {
        Text('ddd')
      }
      .tabBar(this.TabBuilder(TabId.ACHIEVEMENT))

      TabContent() {
        Text('ddd')
          .borderWidth({ bottom: 1 })
          .borderColor($r('app.color.primaryBgColor'))
      }
      .tabBar(this.TabBuilder(TabId.MINE))
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