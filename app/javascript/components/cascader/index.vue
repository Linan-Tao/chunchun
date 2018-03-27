<template>
  <div :class="$htmlClass">
    <el-cascader
        :options="options"
        v-model="selectedOptions"
        @change="handleChange"
        :props="props"
        change-on-select
    >
    </el-cascader>
    <input type="hidden" :name="$htmlName" ref="input">
  </div>
</template>
<script>
import { booleanValue } from '../../utils'
export default {
  name: 'tanmer-catalog',
  data() {
    return {
      options: [],
      selectedOptions: []
    };
  },
  computed: {
    url () {
      return this.$htmlAttributes['url'];
    },
    props () {
      return JSON.parse(this.$htmlAttributes['props']);
    }
  },
  mounted () {
    let values = (this.$htmlAttributes['value'] || '').split(',');
    if (!booleanValue(this.$htmlAttributes['is-string'])) {
        values = values.map(v => parseInt(v))
    }
    this.selectedOptions = values;
    this.$refs.input.value = values.join(',');
    if (this.$htmlAttributes['options']) {
      this.options = JSON.parse(this.$htmlAttributes['options'])
    } else {
      this.$http.get(this.url).then(resp => {
        this.options = resp.data;
      })
    }
  },
  methods: {
      handleChange(value) {
        // this.$refs.input.value = value.join(',');
        console.log(value);
        this.$refs.input.value = value[value.length -1];
        this.$fireHTMLEvent('change', value);
      }
  }
};
</script>