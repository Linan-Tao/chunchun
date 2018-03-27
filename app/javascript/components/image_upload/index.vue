<template>
    <div>
        <div v-for="file in uploadFiles" :key="file.uid">
          <input type="hidden" :name="$htmlName" :value="file.url" />
          <input type="hidden" :name="`encryped_id_for_${$htmlName}`" :value="file.encryped_id" />
        </div>
        <el-upload
          :action="uploadUrl"
          :list-type="listType"
          :multiple="multiple"
          :drag="drag"
          :limit="limit"
          :data="form"
          :file-list="initFileList"
          accept="image/*"
          :on-exceed="handleExceed"
          :before-upload="handleBeforeUpload"
          :on-success="handleSuccess"
          :on-error="handleError"
          :on-preview="handlePictureCardPreview"
          :on-remove="handleRemove">
          <i class="el-icon-plus"></i>
          <div slot="tip" class="el-upload__tip" v-text="tip" v-if="tip"></div>
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
          <img width="100%" :src="dialogImageUrl" alt="">
        </el-dialog>
    </div>
</template>
<script>
import { booleanValue, numberValue } from '../../utils'
  export default {
    data() {
      return {
        dialogImageUrl: '',
        dialogVisible: false,
        form: {
          token: ''
        },
        uploadFiles: []
      };
    },
    computed: {
        tokenUrl () {
            return this.$htmlAttributes['token-url']
        },
        uploadUrl () {
            return this.$htmlAttributes['upload-url'] || '//up-z2.qiniup.com'
        },
        listType () {
            return this.$htmlAttributes['list-type'] || 'picture-card'
        },
        multiple () {
            return booleanValue(this.$htmlAttributes['multiple'])
        },
        drag () {
            return booleanValue(this.$htmlAttributes['drag'])
        },
        limit () {
            return numberValue(this.$htmlAttributes['limit'])
        },
        tip () {
            return this.$htmlAttributes['tip']
        },
        initFileList () {
          if (this.$htmlAttributes['file-list']) {
            return this.$htmlAttributes['file-list'].split(',').map(f => { return { url: f.trim() } })
          } else {
            return [];
          }
        }, 
        domain () {
          return this.$htmlAttributes['domain']
        }
    },
    methods: {
      handleRemove(file, fileList) {
        this.uploadFiles = fileList.map(f => Object.assign({ uid: f.uid, url: f.url }, f.response))
        // console.log('handleRemove', file, fileList)
      },
      handlePictureCardPreview(file) {
        this.dialogImageUrl = file.response ? ('http://' + this.domain + '/' + file.response.key) : file.url;
        this.dialogVisible = true;
      },
      handleBeforeUpload (file) {
        console.log(this.tokenUrl);
        if (this.tokenUrl) {
          return new Promise((resolve, reject) => {
            this.$http.post(this.tokenUrl).then(response => {
            if(response.body.token){
              this.$set(this.form, 'token', response.body.token);
              resolve()
            }else{
              reject();
            }
          }).catch(resp => {
            window.alert('获取上传的Token失败')
            reject()
          });
          })
        } else {
          return true;
        }
      },
      handleSuccess (response, file, fileList) {
        // console.log()
        // http://p64xi7w31.bkt.clouddn.com/FkUIwieJv5K6w4JxqR33ZlDcUm_x
        this.uploadFiles = fileList.map(f => Object.assign({ uid: f.uid, url:  f.response ? ('http://' + this.domain + '/' + f.response.key) : f.url}, f.response))
        console.log('handleSuccess', file, fileList)
      },
      handleError (err, file, fileList) {
        console.log(err);
      },
      handleExceed (file, fileList) {
        window.alert('最多上传' + this.limit + '张图片!')
      }
    },
    mounted () {
      this.uploadFiles = this.initFileList.map(f => Object.assign({ url: f.url }))
    }
  }
</script>
