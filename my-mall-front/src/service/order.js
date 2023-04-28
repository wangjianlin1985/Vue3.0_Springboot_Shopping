import axios from '../utils/axios'

export function createOrder(params) {
  return axios.post('/saveOrder', params);
}

export function getOrderList(params) {
  return axios.get('/order', { params });
}

export function getOrderDetail(id) {
  return axios.get(`/order/${id}`);
}

export function cancelOrder(id) {
  return axios.put(`/order/${id}/cancel`);
}

export function confirmOrder(id) {
  return axios.put(`/order/${id}/finish`)
}

export function payOrder(params) {
  return axios.get('/paySuccess', { params })
}




