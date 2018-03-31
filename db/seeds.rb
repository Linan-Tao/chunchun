CatalogHierarchy.create!([
  {ancestor_id: 1, descendant_id: 1, generations: 0},
  {ancestor_id: 2, descendant_id: 2, generations: 0},
  {ancestor_id: 1, descendant_id: 2, generations: 1},
  {ancestor_id: 3, descendant_id: 3, generations: 0},
  {ancestor_id: 1, descendant_id: 3, generations: 1},
  {ancestor_id: 4, descendant_id: 4, generations: 0},
  {ancestor_id: 1, descendant_id: 4, generations: 1}
])
Ckeditor::Asset.create!([
  {data_file_name: "x2.jpeg", data_content_type: "image/jpeg", data_file_size: 87407, data_fingerprint: "716b4afefb219de9b1e42a2ab2ef6680", type: "Ckeditor::Picture", width: 790, height: 425},
  {data_file_name: "x3.jpeg", data_content_type: "image/jpeg", data_file_size: 137515, data_fingerprint: "c03535035d8d84e6e2a76daefd79427a", type: "Ckeditor::Picture", width: 790, height: 425},
  {data_file_name: "x1.jpg", data_content_type: "image/jpeg", data_file_size: 131085, data_fingerprint: "43da624290689ad4ac252cdabbadd93e", type: "Ckeditor::Picture", width: 790, height: 662},
  {data_file_name: "x4.jpeg", data_content_type: "image/jpeg", data_file_size: 172403, data_fingerprint: "693abff92344c048ee23e0547d3140e7", type: "Ckeditor::Picture", width: 790, height: 955},
  {data_file_name: "xlx2.jpeg", data_content_type: "image/jpeg", data_file_size: 204407, data_fingerprint: "d193d0df3aa20b425565abd8a7aa8bba", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "xlx.jpeg", data_content_type: "image/jpeg", data_file_size: 317552, data_fingerprint: "b732615ddb9146c86b842fe502ffc119", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "xlx3.jpeg", data_content_type: "image/jpeg", data_file_size: 309712, data_fingerprint: "3a470cbf039fa1449d3d802c0e6c93d5", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "xlx4.jpeg", data_content_type: "image/jpeg", data_file_size: 606225, data_fingerprint: "47adf5b38bbb33e8ccc408c431f6d248", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "b2.jpeg", data_content_type: "image/jpeg", data_file_size: 128627, data_fingerprint: "0263761debe9f6ac31700fb72be58d77", type: "Ckeditor::Picture", width: 790, height: 754},
  {data_file_name: "b3.jpeg", data_content_type: "image/jpeg", data_file_size: 149916, data_fingerprint: "b00a6581bf5e8c73d031f16de09c9efb", type: "Ckeditor::Picture", width: 790, height: 767},
  {data_file_name: "b1.jpeg", data_content_type: "image/jpeg", data_file_size: 202021, data_fingerprint: "b2a35b51b7ac0934bb0ac86345bf3964", type: "Ckeditor::Picture", width: 790, height: 1131},
  {data_file_name: "b4.jpeg", data_content_type: "image/jpeg", data_file_size: 97521, data_fingerprint: "676a443bd2338bb2518c671e90c47261", type: "Ckeditor::Picture", width: 790, height: 943},
  {data_file_name: "b5.jpeg", data_content_type: "image/jpeg", data_file_size: 134191, data_fingerprint: "2d754de0475a59e25151fb541c382776", type: "Ckeditor::Picture", width: 790, height: 1001}
])
User.create!([
  {email: "tao@tanmer.com", encrypted_password: "$2a$11$z6haVCPP797Blug1wn/5neq9yGnec0xX0JrsYQNHkCRUgexJ8FRPu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-03-30 07:49:31", last_sign_in_at: "2018-03-30 07:49:31", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
AddressBook.create!([
  {visitor_id: 2, name: "tao", mobile: "18232323", province: nil, city: nil, district: nil, detail_address: "dfsdf", features: nil}
])
Catalog.create!([
  {parent_id: nil, name: "箱包", position: nil},
  {parent_id: 1, name: "行李箱", position: nil},
  {parent_id: 1, name: "双肩包", position: nil},
  {parent_id: 1, name: "背包", position: nil}
])
Order.create!([
  {visitor_id: 2, code: nil, price: 369, status: nil, features: {"delivery_phone"=>"18232323", "delivery_address"=>"dfsdf", "delivery_username"=>"tao"}}
])
OrderProduct.create!([
  {order_id: 1, product_id: 3, amount: 1, price: 369}
])
Product.create!([
  {name: "20寸万向轮旅行箱男女密码登机箱", price: "299", images: ["http://p64xi7w31.bkt.clouddn.com/FmpYruutMoSSQ9gJF1uT92Lqmbt9", "http://p64xi7w31.bkt.clouddn.com/FmmKU9HjembnaeAijW-w4POuICnG", "http://p64xi7w31.bkt.clouddn.com/FmH9L1MaBgYK7ANUfinSlIkEV7dX"], description: "", content: "<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/6/content_xlx.jpeg\" style=\"width: 790px; height: 1033px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/5/content_xlx2.jpeg\" style=\"width: 790px; height: 1033px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/7/content_xlx3.jpeg\" style=\"width: 790px; height: 1033px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/8/content_xlx4.jpeg\" style=\"width: 790px; height: 1033px;\" /></p>\r\n", features: {"stock"=>"10", "sell_price"=>"299"}, catalog_id: 2},
  {name: "红谷牛皮女包小香风链条包包女新款单肩斜挎包迷你小包百搭小方包", price: "369", images: ["http://p64xi7w31.bkt.clouddn.com/FtRxUuAQ_2ltDbkQDQQAeoLI1TUi", "http://p64xi7w31.bkt.clouddn.com/FuIVd3LwGU7qb2wTXtGkB-jeVY1W", "http://p64xi7w31.bkt.clouddn.com/Ftw1R_qxhe0c1XLZH1_OcC3O_owK"], description: "", content: "<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/11/content_b1.jpeg\" style=\"width: 790px; height: 1131px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/9/content_b2.jpeg\" style=\"width: 790px; height: 754px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/10/content_b3.jpeg\" style=\"width: 790px; height: 767px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/12/content_b4.jpeg\" style=\"width: 790px; height: 943px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/13/content_b5.jpeg\" style=\"width: 790px; height: 1001px;\" /></p>\r\n", features: {"stock"=>"100", "sell_price"=>"369"}, catalog_id: 4},
  {name: "商务男士潮流时尚多功能笔记本电脑包", price: "99", images: ["http://p64xi7w31.bkt.clouddn.com/FieXsfessmsy3DBHEMdEO8puOPum", "http://p64xi7w31.bkt.clouddn.com/FnrA0ythI_SCnDyy2HfXfE9WR73V"], description: "", content: "<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/3/content_x1.jpg\" style=\"width: 790px; height: 662px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/1/content_x2.jpeg\" style=\"width: 790px; height: 425px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/2/content_x3.jpeg\" style=\"width: 790px; height: 425px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://localhost:3000/ckeditor_assets/pictures/4/content_x4.jpeg\" style=\"width: 790px; height: 955px;\" /><img alt=\"\" src=\"https://wx.jjerp.cn/ckeditor_assets/pictures/3/content_x1.jpg\" /><img alt=\"\" src=\"https://wx.jjerp.cn/ckeditor_assets/pictures/4/content_x4.jpeg\" /></p>\r\n", features: {"stock"=>"100", "sell_price"=>"99"}, catalog_id: 3}
])
ShoppingCart.create!([
  {product_id: 3, price: 369, amount: 1, visitor_id: 1},
  {product_id: 1, price: 99, amount: 1, visitor_id: 1},
  {product_id: 1, price: 99, amount: 1, visitor_id: 2}
])
Visitor.create!([
  {uid: "oNwIJ45TybLStebf3pXZFwr9y_Fg", nickname: "小陶", headshot: "https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKaRiaG7ibAfdDox0dttXLCjbrYiafr7okAYymqhmPicI0xT36icRVY8YEExcKpQ3zsRV8ib0V2ibNSiaLUBw/0"},
  {uid: "oNWgu5QLhofUEAgYqsVQ2gQzUQc4", nickname: "小陶", headshot: "https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkksNNnxhQ1VzibaQ1icDjoIibBbAxJ2c8uF8mrHtbibicictu8sGiaBWLBHKQalG0X460JkBrS7vE0ERmA/0"}
])
Ckeditor::Picture.create!([
  {data_file_name: "x2.jpeg", data_content_type: "image/jpeg", data_file_size: 87407, data_fingerprint: "716b4afefb219de9b1e42a2ab2ef6680", type: "Ckeditor::Picture", width: 790, height: 425},
  {data_file_name: "x3.jpeg", data_content_type: "image/jpeg", data_file_size: 137515, data_fingerprint: "c03535035d8d84e6e2a76daefd79427a", type: "Ckeditor::Picture", width: 790, height: 425},
  {data_file_name: "x1.jpg", data_content_type: "image/jpeg", data_file_size: 131085, data_fingerprint: "43da624290689ad4ac252cdabbadd93e", type: "Ckeditor::Picture", width: 790, height: 662},
  {data_file_name: "x4.jpeg", data_content_type: "image/jpeg", data_file_size: 172403, data_fingerprint: "693abff92344c048ee23e0547d3140e7", type: "Ckeditor::Picture", width: 790, height: 955},
  {data_file_name: "xlx2.jpeg", data_content_type: "image/jpeg", data_file_size: 204407, data_fingerprint: "d193d0df3aa20b425565abd8a7aa8bba", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "xlx.jpeg", data_content_type: "image/jpeg", data_file_size: 317552, data_fingerprint: "b732615ddb9146c86b842fe502ffc119", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "xlx3.jpeg", data_content_type: "image/jpeg", data_file_size: 309712, data_fingerprint: "3a470cbf039fa1449d3d802c0e6c93d5", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "xlx4.jpeg", data_content_type: "image/jpeg", data_file_size: 606225, data_fingerprint: "47adf5b38bbb33e8ccc408c431f6d248", type: "Ckeditor::Picture", width: 790, height: 1033},
  {data_file_name: "b2.jpeg", data_content_type: "image/jpeg", data_file_size: 128627, data_fingerprint: "0263761debe9f6ac31700fb72be58d77", type: "Ckeditor::Picture", width: 790, height: 754},
  {data_file_name: "b3.jpeg", data_content_type: "image/jpeg", data_file_size: 149916, data_fingerprint: "b00a6581bf5e8c73d031f16de09c9efb", type: "Ckeditor::Picture", width: 790, height: 767},
  {data_file_name: "b1.jpeg", data_content_type: "image/jpeg", data_file_size: 202021, data_fingerprint: "b2a35b51b7ac0934bb0ac86345bf3964", type: "Ckeditor::Picture", width: 790, height: 1131},
  {data_file_name: "b4.jpeg", data_content_type: "image/jpeg", data_file_size: 97521, data_fingerprint: "676a443bd2338bb2518c671e90c47261", type: "Ckeditor::Picture", width: 790, height: 943},
  {data_file_name: "b5.jpeg", data_content_type: "image/jpeg", data_file_size: 134191, data_fingerprint: "2d754de0475a59e25151fb541c382776", type: "Ckeditor::Picture", width: 790, height: 1001}
])
