import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store' 
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import './assets/css/global.css'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
const app =createApp(App)
    .use(store)
    .use(router)
    .use(ElementPlus, {locale: zhCn,size: 'small'})
    .mount('#app')
    app.use(ElementPlus)
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
        app.component(key, component)
      }