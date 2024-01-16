import HttpConstant from '../../common/httpwrapper/HttpConstant';

import axiosHttp from '../../common/axiosWrapper';
import request from '../../common/httpwrapper';

@Component
export struct TestHttp {
  // aboutToAppear() {
  //   this.testAxios()
  //   this.onHttp()
  // }

  async testAxios() {
    try {
      let responseData = await axiosHttp.get('http://192.168.1.2:8080/api/getRecommend')
      console.info('ghy-testAxios----:',JSON.stringify(responseData))
    } catch (e) {
      console.info(e)
    }
  }

      async onHttp() {
        try {
          // /api/getRecommend
          let result = await request.get('http://192.168.1.2:8080/api/getRecommend');
          console.info('ghy-onHttp----:',JSON.stringify(result))
        } catch (error) {

        }

      }

  build() {
    Column() {
      Button('测试请求Axios').onClick(() => {
        this.testAxios()
      })
      Button('测试请求http').onClick(() => {
        this.onHttp()
      })
    }
    .width('100%')
    .height('30%')

  }
}