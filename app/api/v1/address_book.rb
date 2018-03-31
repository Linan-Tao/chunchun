module V1
  class AddressBook < Base
    helpers SharedParams
    resources :address_books do
      desc '创建地址簿' do
        success Entities::AddressBook
      end
      params do
        requires :name, type: String, desc: '收货人名字'
        requires :mobile, type: String, desc: '电话'
        # requires :province, type: String, desc: '省'
        # requires :city, type: String, desc: '市'
        # requires :district, type: String, desc: '区'
        requires :detail_address, type: String, desc: '详细地址'
      end
      post do
        authenticate!
        address_book = current_visitor.address_books.new
        address_book.name = params[:name]
        address_book.mobile = params[:mobile]
        # address_book.province = params[:province]
        # address_book.city = params[:city]
        # address_book.district = params[:district]
        address_book.detail_address = params[:detail_address]
        error! address_book.errors unless address_book.save
        present address_book, with: Entities::AddressBook
      end

      desc '修改地址簿' do
        success Entities::AddressBook
      end
      params do
        requires :id, type: Integer, desc: '地址薄ID'
        requires :name, type: String, desc: '收货人名字'
        requires :mobile, type: String, desc: '电话'
        # requires :province, type: String, desc: '省'
        # requires :city, type: String, desc: '市'
        # requires :district, type: String, desc: '区'
        requires :detail_address, type: String, desc: '详细地址'
      end
      put ':id' do
        authenticate!
        address_book = ::AddressBook.find(params[:id])
        address_book.name = params[:name]
        address_book.mobile = params[:mobile]
        # address_book.province = params[:province]
        # address_book.city = params[:city]
        # address_book.district = params[:district]
        address_book.detail_address = params[:detail_address]
        error! address_book.errors unless address_book.save
        present address_book, with: Entities::AddressBook
      end

      desc '查看地址簿' do
        success Entities::AddressBook
      end
      get do
        authenticate!
        # 目前只支持一个地址
        present current_visitor.address_books.first, with: Entities::AddressBook
      end

      desc '删除地址薄' do
        success Entities::AddressBook
      end
      params do
        requires :id, type: Integer, desc: '地址薄ID'
      end
      delete ':id' do
        authenticate!
        address_book = ::AddressBook.find(params[:id]).destroy
        present address_book, with: Entities::AddressBook
      end
    end
    # end of resources
  end
end
