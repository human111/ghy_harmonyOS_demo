export default class HttpConstant {
  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'https://www.harmonyos.com';

  /**
   * The request success code.
   */
  static readonly SUCCESS_CODE: number = 200;

  /**
   * Read timeout.
   */
  static readonly READ_TIMEOUT: number = 50000;

  /**
   * Connect timeout.
   */
  static readonly CONNECT_TIMEOUT: number = 50000;
}