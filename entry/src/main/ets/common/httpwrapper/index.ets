
import http from '@ohos.net.http';
import HttpConstant from './HttpConstant';

const get = async (url: string) => {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();
  let options = {
    method: http.RequestMethod.GET,
    header: { 'Content-Type': 'application/json' },
    readTimeout: HttpConstant.READ_TIMEOUT,
    connectTimeout: HttpConstant.CONNECT_TIMEOUT
  } as http.HttpRequestOptions;
  let result = await request.request(url, options);
  // console.info('===456==:', JSON.stringify(result))
  return result;
}

const wrapper = {
  get
}

export default wrapper;

