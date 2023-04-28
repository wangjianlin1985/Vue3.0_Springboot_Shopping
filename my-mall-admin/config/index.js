export default {
  development: {
    baseUrl: '/api' // 测试接口域名
  },
  beta: {
    baseUrl: '//localhost:8008/manage-api/v1' // 测试接口域名
  },
  release: {
    baseUrl: '//localhost:8008/manage-api/v1' // 正式接口域名
  }
}