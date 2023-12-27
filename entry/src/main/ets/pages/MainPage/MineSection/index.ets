import { MineHeader } from './components/Header'
import { NavTagSet } from './components/NavTagSet'
import { OperationRecord } from './components/OperationRecord'
@Component
export struct MineSection {

  build() {
    Column() {
      Scroll() {
        Column() {
          MineHeader()
          NavTagSet()
          OperationRecord()

          // Column().width('100%').height('180vp').backgroundColor('#aa5050')
          // Column().width('100%').height('180vp').backgroundColor('#bb5050')
          // Column().width('100%').height('180vp').backgroundColor('#cc5050')
          // Column().width('100%').height('180vp').backgroundColor('#dd5050')
        }
      }
      .height('100%')
    }
    .height('100%')
    .width('100%')
  }
}