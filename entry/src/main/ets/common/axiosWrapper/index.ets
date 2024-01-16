// https://gitee.com/openharmony-sig/ohos_axios

import axios, { AxiosRequestConfig, AxiosResponse } from '@ohos/axios'
import hilog from '@ohos.hilog';
// import qs from '../../../../../types/qs';
// import qs from 'qs';


// 后端约定的接口响应数据结构
export interface IServerResponse<Data> {
  code: number;
  msg?: string;
  result?: Data;
  data: Data;
}

// TODO: [请求拦截器]

// TODO: [响应拦截器]

// TODO: [对Ajax请求拦截，对异常业务状态码进行上报，理论上也属于响应拦截器]

/**
  * 检查业务状态码是否为 0
  *
  * @param response Axios 响应体实例
  */
const responseHandler = (response: AxiosResponse<IServerResponse<any>>) => {
    console.info('responseHandler', JSON.stringify(response.data))
    // hilog.info(0x0000, 'responseHandler', JSON.stringify(response));
    if (response.data && response.data.code === 0) {
        return response.data.data || response.data.result;
    }

    throw Error((response.data && response.data.msg) || '网络异常，请稍后再试');
};

/*
 * 多行注释快捷键：cmd + option + /
 * 发送一个 GET 请求，并统一封装数据字段解析逻辑
 *
 * */
const get = <T = any>(url: string, config?: AxiosRequestConfig): Promise<T> => axios.get<IServerResponse<T>>(url, config).then(responseHandler, () => {
    throw Error('网络异常，请稍后再试');
});

/**
 * 发送一个 POST 请求，并统一封装数据字段解析逻辑
 */

const post = <T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<T> => axios.post<IServerResponse<T>>(url, data, config).then(responseHandler, () => {
    throw Error('网络异常，请稍后再试');
});

// const postAsFormSubmit = <T = any>(url: string, data?: any): Promise<T> => post<T>(url, qs.stringify(data), {
//     headers: { 'content-type': 'application/x-www-form-urlencoded' },
// });

const rawGet = <T = any>(url: string, config?: AxiosRequestConfig): Promise<T> => axios.get<T>(url, config).then((r) => r.data);

const rawPost = <T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<T> => axios.post<T>(url, data, config).then((r) => r.data);

// const rawPostAsFormSubmit = <T = any>(url: string, data?: any): Promise<T> => axios.post<T>(url, qs.stringify(data), {
//     headers: { 'content-type': 'application/x-www-form-urlencoded' },
// }).then((r) => r.data);

const wrapper = {
  get,
  post,
  // postAsFormSubmit,
  rawGet,
  rawPost,
  // rawPostAsFormSubmit,
}

export default wrapper;

