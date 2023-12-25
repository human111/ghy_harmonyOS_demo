import { CssConst } from '../../../../common/constants/CssConst';

@Component
export struct SearchInput {
  @State searchInput: string = '';
  @Link searchArr: Array<string>;

  build() {
    Flex({ alignItems: ItemAlign.Center }) {
      // icon自定义属性有问题
      Search({
        value: this.searchInput,
        placeholder: '搜索歌曲、歌手1',
        // icon: '../../../../../resources/base/media/ic_good.png'
        // icon: CssConst.SEARCH_ICON
      })
        .placeholderColor('#787F87')
        .placeholderFont({ size: '16fp' })
        .textFont({ size: '16fp' })
        .height(CssConst.SEARCH_HEIGHT)
        .width(CssConst.SEARCH_WIDTH)
        .backgroundColor(Color.White)
        .margin({
          left: '12vp',
          right: '14vp',
          top: '8vp',
          bottom: '8vp'
        })
        .border({
          width: '1vp',
          color: '#33182431',
          radius: '20vp',
          style: BorderStyle.Solid
        })
        .backgroundColor('#F5F5F5')
        .onChange((value: string) => {
          this.searchInput = value;
        })

      Text('搜索')
        .fontSize('16fp')
        .fontColor('#007DFF')
        .onClick(() => {
          if (this.searchInput !== '' && this.searchInput.trim().length > 0) {
            this.searchArr.unshift(this.searchInput.trim());
          }
          this.searchInput = '';
        })
    }
    .width(CssConst.THOUSANDTH_1000)
    .margin({bottom: '20vp'})
  }
}