import { createApp } from 'vue'
import App from './App.vue'
import router from "@/router/router.js";
import axios from "axios";
import {createPinia} from "pinia";

axios.defaults.baseURL = '/api/v1'; // ingress 설정으로 인해 변경
const pinia = createPinia();

const app = createApp(App); // Vue 애플리케이션 생성

app.config.globalProperties.axios = axios;
app.use(pinia);
app.use(router);  // 애플리케이션에 라우터 추가
app.mount('#app');