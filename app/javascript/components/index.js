import VCA from 'vue-component-anywhere'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk'
import Tag from './tag'
import ImageUpload from './image_upload'
import Catalog from './catalog'
import Cascader from './cascader'
import Select from './select'

function plugin(Vue) {
  if (plugin.installed) return;
  Vue.use(ElementUI)
  Vue.use(VCA, { onLoadEventName: 'turbolinks:load' })
  // Vue.component('CatalogList', require('./catalog'))
  VCA.add('tag', Tag)
  VCA.add('image-upload', ImageUpload)
  VCA.add('catalog-list', Catalog)
  VCA.add('cascader', Cascader)
  VCA.add('select', Select)
}

export default plugin
