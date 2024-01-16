// Type definitions for qs 6.9
// Project: https://github.com/ljharb/qs

// 解决问题：https://developer.huawei.com/consumer/cn/forum/topic/0209121904154126088?fid=0101587866109860105
export = QueryString;
export as namespace qs;

declare namespace QueryString {
    type defaultEncoder = (str: any, defaultEncoder?: any, charset?: string) => string;
    type defaultDecoder = (str: string, decoder?: any, charset?: string) => string;

    interface IStringifyOptions {
        delimiter?: string;
        strictNullHandling?: boolean;
        skipNulls?: boolean;
        encode?: boolean;
        encoder?: (str: any, defaultEncoder: defaultEncoder, charset: string, type: 'key' | 'value') => string;
        filter?: Array<string | number> | ((prefix: string, value: any) => any);
        arrayFormat?: 'indices' | 'brackets' | 'repeat' | 'comma';
        indices?: boolean;
        sort?: (a: any, b: any) => number;
        serializeDate?: (d: Date) => string;
        format?: 'RFC1738' | 'RFC3986';
        encodeValuesOnly?: boolean;
        addQueryPrefix?: boolean;
        allowDots?: boolean;
        charset?: 'utf-8' | 'iso-8859-1';
        charsetSentinel?: boolean;
    }

    interface IParseOptions {
        comma?: boolean;
        delimiter?: string | RegExp;
        depth?: number | false;
        decoder?: (str: string, defaultDecoder: defaultDecoder, charset: string, type: 'key' | 'value') => any;
        arrayLimit?: number;
        parseArrays?: boolean;
        allowDots?: boolean;
        plainObjects?: boolean;
        allowPrototypes?: boolean;
        parameterLimit?: number;
        strictNullHandling?: boolean;
        ignoreQueryPrefix?: boolean;
        charset?: 'utf-8' | 'iso-8859-1';
        charsetSentinel?: boolean;
        interpretNumericEntities?: boolean;
    }

    interface ParsedQs { [key: string]: undefined | string | string[] | ParsedQs | ParsedQs[] }

    function stringify(obj: any, options?: IStringifyOptions): string;
    function parse(str: string, options?: IParseOptions & { decoder?: never }): ParsedQs;
    function parse(str: string | Record<string, string>, options?: IParseOptions): { [key: string]: unknown };
}
