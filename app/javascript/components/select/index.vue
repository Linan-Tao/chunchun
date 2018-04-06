<template>
  <div :class="$htmlClass">
    <el-select
      :filterable="selectAttr.filterable"
      :allow-create="selectAttr['allow-create']"
      :multiple="selectAttr.multiple"
      :multiple-limit="selectAttr['multiple-limit']"
      v-model="selectedOptions"
      @change="handleChange"
      placeholder="请选择">
      <el-option
        v-for="item in options"
        :key="item.id"
        :label="item.name"
        :value="item.id">
      </el-option>
    </el-select>
    <input type="hidden" :name="$htmlName" ref="input">
  </div>
</template>

<script>
  import { booleanValue, numberValue } from '../../utils'

  export default {
    data() {
      return {
        selectedOptions: [],
        options: []
      }
    },
    computed: {
      url () {
        return this.$htmlAttributes['url'];
      },
      selectAttr () {
        return {
          filterable: booleanValue(this.$htmlAttributes['filterable']),
          'allow-create': booleanValue(this.$htmlAttributes['allow-create']),
          multiple: booleanValue(this.$htmlAttributes['multiple']),
          'multiple-limit': numberValue(this.$htmlAttributes['multiple-limit'])
        }
      }
    },
    mounted () {
      // this.value = this.$htmlAttributes['value'];
      let values = (this.$htmlAttributes['value'] || '').split(',');
      // if (!booleanValue(this.$htmlAttributes['is-string'])) {
      //     values = values.map(v => parseInt(v))
      // }
      // this.selectedOptions = values;
      this.$refs.input.value = values.join(',');
      if (this.$htmlAttributes['options']) {
        this.options = JSON.parse(this.$htmlAttributes['options'])
      } else {
        this.$http.get(this.url).then(resp => {
          this.options = resp.data;
          values = values.map(v => parseInt(v))
          let opt = this.options.filter((o) => { return values.indexOf(o.id) > -1});
          console.log(this.options)
          console.log(opt)
          this.selectedOptions = opt.map((op) => {return op.name});
        })
      }

    },
    methods: {
      handleChange(value) {
        this.$refs.input.value = value;
        this.$fireHTMLEvent('change', value);
      }
    }
  }
</script>
