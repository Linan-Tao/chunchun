class RootAPI < Grape::API
  rescue_from ActiveRecord::RecordNotFound, ->() { error!({error: 'Record not found'}, 404) }
  format :json
  prefix :api
  
  helpers ApiHelpers
  mount V1::Base
  add_swagger_documentation \
    info: {
      title: "TMF API",
      # description: "",
      # contact_name: "Xiaohui",
      # contact_email: "xiaohui@tanmer.com",
    }
end