<template>
    <div :class="$htmlClass">
        <input type="hidden" v-if="$htmlName" :name="$htmlName" ref="hiddenInput" :value="hiddenInputValue">
        <el-tag
        :key="tag"
        v-for="tag in dynamicTags"
        :type="tagAttr.type"
        :closable="tagAttr.closable"
        :disable-transitions="tagAttr['disable-transitions']"
        :hit="tagAttr.hit"
        :color="tagAttr.color"
        :size="tagAttr.size"
        @close="handleClose(tag)">
        {{tag}}
        </el-tag>
        <el-input
        :class="`input-new-tag size-${tagAttr.size || 'default'}`"
        v-if="inputVisible"
        v-model="inputValue"
        ref="saveTagInput"
        
        @keydown.enter.native.prevent="handleInputConfirm"
        @blur="handleInputConfirm"
        >
        </el-input>
        <el-button v-else :class="`button-new-tag size-${tagAttr.size || 'default'}`" :type="tagAttr.type" @click="showInput">
          {{tagAttr.size === 'mini' ? '+' : '+ 添加'}}
        </el-button>
    </div>
</template>

<script>
import { booleanValue } from '../../utils'
export default {
  name: 'tanmer-tag',
  data() {
    return {
      dynamicTags: [],
      inputVisible: false,
      inputValue: ""
    };
  },
  computed: {
      hiddenInputValue () {
          return this.dynamicTags.join(',')
      },
      tagAttr () {
        return {
          type: this.$htmlAttributes['type'],
          closable: booleanValue(this.$htmlAttributes['closable']),
          'disable-transitions': booleanValue(this.$htmlAttributes['disable-transitions']),
          hit: booleanValue(this.$htmlAttributes['hit']),
          color: this.$htmlAttributes['color'],
          size: this.$htmlAttributes['size']
        }
      }
  },
  mounted () {
      this.dynamicTags = this.splitValue(this.$htmlAttributes['value'])
  },
  methods: {
    splitValue (v) {
        return (v || '').split(/[,， ]/).map(item => item.trim()).filter(item => item)
    },
    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
    },

    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },

    handleInputConfirm() {
      let inputValue = this.inputValue;
      this.splitValue(this.inputValue).forEach(item => {
          if (this.dynamicTags.indexOf(item) === -1) {
              this.dynamicTags.push(item)
          }
      })
      this.inputVisible = false;
      this.inputValue = "";
    }
  }
};
</script>


<style scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}

.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}

.button-new-tag {
  margin-left: 10px;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 10px;
  padding-right: 10px;
}
.size-default{
  height: 32px;
  line-height: 30px;
  font-size: 12px;
}
.size-medium{
  height: 28px;
  line-height: 26px;
  font-size: 12px;
}
.size-small{
  height: 24px;
  line-height: 22px;
  font-size: 12px;
}
.size-mini{
  height: 20px;
  line-height: 18px;
}
</style>
