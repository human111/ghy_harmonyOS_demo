
import { HistoryList } from './components/HistoryList';
import { HotSearch } from './components/HotSearch';
import { SearchInput } from './components/SearchInput';
import { SuggestedList } from './components/SuggestedList';

@Component
export struct SearchSection {
  @State searchValue: string = '';
  @State searchResult: string[] = [];
  private controller: TextInputController = new TextInputController();
  @State searchArr: Array<string> = ['2223','333'];


  build() {
    Column() {
      SearchInput({ searchArr: $searchArr})
      if (this.searchResult && this.searchResult.length > 0) {
        SuggestedList()
      } else {
        HotSearch()
        HistoryList({ searchArr: $searchArr})
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}