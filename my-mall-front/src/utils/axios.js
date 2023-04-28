import axios from 'axios'
import { Toast } from 'vant'
import { setLocal } from '@/common/js/utils'
import router from '../router'

axios.defaults.baseURL = process.env.NODE_ENV == 'development' ? '//localhost:8008/api/v1' : '//backend-api-01.newbee.ltd/api/v1'
axios.defaults.withCredentials = true
axios.defaults.headers['X-Requested-With'] = 'XMLHttpRequest'
axios.defaults.headers['token'] = localStorage.getItem('token') || ''
axios.defaults.headers.post['Content-Type'] = 'application/json'

axios.interceptors.response.use(res => {
  if (typeof res.data !== 'object') {
    Toast.fail('服务端异常！')
    return Promise.reject(res)
  }
  if (res.data.resultCode != 200) {
    if (res.data.message) Toast.fail(res.data.message)
    if (res.data.resultCode == 416) {
      router.push({ path: '/login' })
    }
    if (res.data.data && window.location.hash == '#/login') {
      setLocal('token', res.data.data)
      axios.defaults.headers['token'] = res.data.data
    }
    return Promise.reject(res.data)
  }

  return res.data
})

export default axios
