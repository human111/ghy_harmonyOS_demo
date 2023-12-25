import { TabId } from '../../../../common/constants/EnumDefine'

export interface NavItem {
  icon: Resource;
  icon_selected: Resource | string;
  text: Resource | string;
  id: number;
}

// Mock 数据
export const NavList: NavItem[] = [
  {
    icon: $r('app.media.tab_dynamic'),
    icon_selected: $r("app.media.tab_dynamic_checked"),
    text: '动态',
    id: TabId.DYNAMIC
  },
  {
    icon: $r('app.media.tab_discovery'),
    icon_selected: $r('app.media.tab_discovery_checked'),
    text: '发现',
    id: TabId.DISCOVERY
  },
  {
    icon: $r('app.media.tab_record'),
    icon_selected: $r('app.media.tab_record'),
    text: '',
    id: TabId.DISCOVERY
  },
  {
    icon: $r('app.media.tab_message'),
    icon_selected: $r('app.media.tab_message_checked'),
    text: '消息',
    id: TabId.MESSAGE
  },
  {
    icon: $r('app.media.tab_mine'),
    icon_selected: $r('app.media.tab_mine_checked'),
    text: '我的',
    id: TabId.MINE
  },
]
