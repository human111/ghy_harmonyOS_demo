
import { HistoryList } from './components/HistoryList';
import { HotSearch } from './components/HotSearch';
import { SuggestedList } from './components/SuggestedList';

@Component
export struct SearchSection {
  @State searchValue: string = '';
  @State searchResult: string[] = [];
  private controller: TextInputController = new TextInputController();

  @Builder SearchInput() {
    Search({ value: this.searchValue, placeholder: '搜索歌曲、歌手', controller: this.controller })
      .width('90%')
      .height(40)
      .margin(20)
      .backgroundColor(Color.White)
      .placeholderColor(Color.Grey)
      .placeholderFont({ size: 14, weight: 400 })
      .textFont({ size: 14, weight: 400 })
      .onSubmit((value: string) => {
        console.log('=====')
        this.searchResult = ['23','45','67'];
      })
      .onChange((value: string) => {
        console.log('==SearchInput onChange===', value)
        if (!value) {
          this.searchResult = [];
        }
        this.searchValue = value;
      })
      .backgroundColor('#F2F2F2')
  }

  build() {
    Column() {
      this.SearchInput()
      if (this.searchResult && this.searchResult.length > 0) {
        SuggestedList()
      } else {
        HotSearch()
        HistoryList()
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}