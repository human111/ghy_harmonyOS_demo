import { TabId } from '../../../../common/constants/EnumDefine'

export interface NavItem {
  icon: Resource;
  icon_selected: Resource;
  text: Resource;
  id: number;
}

// Mock 数据
export const NavList: NavItem[] = [
  {
    icon: $r('app.media.ic_tabs_home_normal'),
    icon_selected: $r('app.media.ic_tabs_home_sel'),
    text: $r('app.string.tab_home'),
    id: TabId.HOME
  },
  {
    icon: $r('app.media.ic_tabs_achievement_normal'),
    icon_selected: $r('app.media.ic_tabs_achievement_sel'),
    text: $r('app.string.tab_achievement'),
    id: TabId.ACHIEVEMENT
  },
  {
    icon: $r('app.media.ic_tabs_mine_normal'),
    icon_selected: $r('app.media.ic_tabs_mine_sel'),
    text: $r('app.string.tab_mine'),
    id: TabId.MINE
  },
]
