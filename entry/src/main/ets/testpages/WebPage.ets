import webView from '@ohos.web.webview';
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction'
import request from '../common/httpwrapper';
import HttpConstant from '../common/httpwrapper/HttpConstant';

import axiosHttp from '../common/axiosWrapper';

@Entry
@Component
struct WebPage {
  controller: webView.WebviewController = new webView.WebviewController();
  @State buttonName: string = 'request';
  @State webVisibility: Visibility = Visibility.Hidden;
  @State webSrc: string = HttpConstant.SERVER;

  aboutToAppear() {
    // this.testAxios()
    this.onHttp()
  }

  async testAxios() {
    try {
      let responseData = await axiosHttp.get('http://192.168.1.2:8080/api/getRecommend')
      console.info('ghy----:',responseData)
    } catch (e) {
      console.info(e)
    }
  }

  // ⌘] 向右缩进  ⌘[ 向左缩进
  async  onHttp() {
    try {
      // /api/getRecommend
      let result = await request.get('http://192.168.1.2:8080/api/getRecommend');
    } catch (error) {
    }
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ghy_singer_6'))
          .height('30vp')
          .width('30vp')
          .borderRadius('10vp')
        TextInput({ placeholder: '情输入地址', text: this.webSrc })
          .height('40vp')
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            this.webSrc = value;
          })
      }
      .margin({
        top: '12vp',
        left: '12vp',
        right: '12vp'
      })
      .height('56vp')
      .backgroundColor(Color.White)
      .borderRadius('28vp')
      .padding({
        left: '12vp',
        right: '12vp'
      })
      Row() {
        Web({ src: this.webSrc, controller: this.controller })
          .zoomAccess(true)
          .height('100%')
          .width('100%')
      }
      .visibility(this.webVisibility)
      .height('83%')
      .width('100%')
      .align(Alignment.Top)
      Row() {
        Button(this.buttonName)
          .fontSize('16fp')
          .width('90%')
          .height('40vp')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.onRequest();
          })
      }
      .height('56vp')
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.ghy_singer_2', ImageRepeat.NoRepeat))
    .backgroundImageSize(ImageSize.Cover)
  }



  async onRequest() {
    if (this.webVisibility === Visibility.Hidden) {
      this.webVisibility = Visibility.Visible;
      try {
        let result = await request.get(this.webSrc);
        if (result && result.responseCode === http.ResponseCode.OK) {
          this.controller.clearHistory();
          this.controller.loadUrl(this.webSrc);
        }
      } catch (error) {
        promptAction.showToast({
          message: '网络请求错误❌！'
        })
      }
    } else {
      this.webVisibility = Visibility.Hidden;
    }
  }
}