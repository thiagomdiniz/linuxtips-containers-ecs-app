import http from 'k6/http';

export const options = {
  vus: 3,
  duration: '1000s',
};

const params = {
  headers: {
    'Content-Type': 'application/json',
    'Host': 'chip.linuxtips.demo',
  }
}

export default function () {
  http.get('http://linuxtips-ecs-cluster-ingress-1434096222.us-east-1.elb.amazonaws.com/system', params);
}