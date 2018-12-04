Category.create!  name: "Make up",
                  description: "Make up Cosmetic"
Category.create!  name: "Cleansing",
                  description: "Cleansing Cosmetic"
Category.create!  name: "Body",
                  description: "Body Cosmetic"
Category.create!  name: "Hair",
                  description: "Hair Cosmetic"
Category.create!  name: "For men",
                  description: "For men Cosmetic"
Trademark.create! name: "Skin food",
                  country: "Korea"
Trademark.create! name: "The body shop",
                  country: "Korea"
Trademark.create! name: "Dior",
                  country: "USA"
Trademark.create! name: "Muji",
                  country: "Japan"
Trademark.create! name: "Sanoflore",
                  country: "France"

Cosmetic.create!(name:  "Kẻ Mắt Isehan Kiss",
             price: 160000,
             quantity_in_store: "6",
             image: Rails.root.join("app/assets/images/kemat.jpg").open,
             category_id: "1",
             trademark_id: "2",
             description: "Dễ kẻ lắm đó nên các bạn có thể sắm em ấy về để tập kẻ mắt nhé, em có màu đen và mực ra rất đều luôn nha.")

Cosmetic.create!(name:  "Phấn Nền 4 Trong 1 L’Oreal",
             price: 190000,
             quantity_in_store: "10",
              image: Rails.root.join("app/assets/images/phannen1.png").open,
             category_id: "1",
             trademark_id: "1",
             description: "Phấn nền 4 trong 1 L’Oreal True Match Genius là sản phẩm phấn nén dạng kem đầu tiên trên thị trường với 4 công dụng chỉ trong 1 sản phẩm, cho lớp trang điểm mịn mượt ngay lập tức. Sản phẩm che khuyết điểm hoàn hảo mang lại lớp nền đẹp tự nhiên. Hãy trải nghiệm một diện mạo hoàn toàn mới với phấn nền 4 trong 1 L’Oreal True Match Genius.")

Cosmetic.create!(name: "Sữa Rửa Mặt DHC",
             price: 190000,
             quantity_in_store: "3",
             image: Rails.root.join("app/assets/images/srm1.png").open,
             category_id: "2",
             trademark_id: "4",
             description: "Sữa Rửa Mặt DHC Acne Control Medicated 130g dạng kem sẽ đem lại cảm giác thoải mái cho làn da khi dùng mà không gây khô căng.

                Và trong sữa rửa mặt còn có chứa hoạt chất trị mụn – Isopropyl Methylphenol. Tiêu diệt và ngăn chăn sự xuất hiện của vi khuẩn mụn ngay từ bước làm sạch.")

Cosmetic.create!(name: "Dầu Gội L’oreal Paris",
             price: 190000,
             quantity_in_store: "4",
             image: Rails.root.join("app/assets/images/dg1.png").open,
             category_id: "4",
             trademark_id: "5",
             description: "Dầu gội với công thức giàu dưỡng chất nuôi dưỡng vượt trội cùng màng lọc tia UV giúp bảo vệ tóc khỏi tia UVA, UVB và những tác nhân gây hại bên ngoài cho tóc mềm mượt hơn trông thấy.")

Cosmetic.create!(name: "Dưỡng Thể Tẩy Tế Bào Chết Paula’s Choice ",
             price: 190000,
             quantity_in_store: "5",
             image: Rails.root.join("app/assets/images/body1.png").open,
             category_id: "3",
             trademark_id: "4",
             description: "Một sản phẩm kết hợp dưỡng ẩm và tẩy da chết dạng hóa học lưu lại trên da, giúp nuôi dưỡng làn da cơ thể mềm mại, mịn màng, làm sáng tone da và ngăn ngừa viêm lỗ chân lông. Sản phẩm có kết cấu kem lỏng, dễ bôi, thấm cực nhanh được mệnh danh là một trong những Body Lotion đáng sử dụng nhất.")

Cosmetic.create!(name: "Viên uống chống nắng nội sinh Murad",
             price: 190000,
             quantity_in_store: "6",
             image: Rails.root.join("app/assets/images/formen1.jpg").open,
             category_id: "5",
             trademark_id: "3",
             description: "Việc bổ sung viên uống chống nắng sẽ giúp chúng mình không chỉ bảo vệ da trọn vẹn 100% khỏi nắng, bảo vệ tế bào từ trong ra ngoài và đặc biệt còn sửa chữa hư tổn và kéo dài tuổi thọ tế bào.")
Cosmetic.create!(name: "Set Son Kem YSL Mini 3 Cây",
             price: 360000,
             quantity_in_store: "10",
             image: Rails.root.join("app/assets/images/son2.jpg").open,
             category_id: "1",
             trademark_id: "5",
             description: "Chất son kem nhẹ, mềm mượt. Độ lên màu cực chuẩn và bám màu tốt trong nhiều giờ. Làm căng đầy những rãnh môi khô nứt.")
Cosmetic.create!(name: "Son Iris",
             price: 200000,
             quantity_in_store: "10",
             image: Rails.root.join("app/assets/images/son1.jpg").open,
             category_id: "1",
             trademark_id: "3",
             description: "Chất son kem nhẹ, mềm mượt. Độ lên màu cực chuẩn và bám màu tốt trong nhiều giờ. Làm căng đầy những rãnh môi khô nứt.")
Cosmetic.create!(name: "Sữa Rửa Mặt Biore Face Wash",
             price: 200000,
             quantity_in_store: "10",
             image: Rails.root.join("app/assets/images/srm2.jpg").open,
             category_id: "2",
             trademark_id: "1",
             description: "Phải công nhận, chưa bao giờ các dòng Sữa Rửa Mặt Biore Face Wash ngừng hot. Bởi đến với Biore, là chúng mình đến với 1 thế giới “đủ đầy” từ A-Z các nhu cầu cần có với mức giá cực “yêu thương”.")
Cosmetic.create!(name: "Kem Nhuộm Tóc L’Oreal Paris",
             price: 400000,
             quantity_in_store: "10",
             image: Rails.root.join("app/assets/images/nhuomtoc1.png").open,
             category_id: "4",
             trademark_id: "5",
             description: "Công dụng: cho màu sắc tự nhiên mà vẫn bảo vệ tóc mềm mượt sau khi nhuộm.")


11.upto(30) do |n|
  title = "Cosmetic #{n}"
  des = "Cosmetic-#{n} description"
  Cosmetic.create!(name: title,
             price: 190000,
             quantity_in_store: rand(1..10),
             image: Rails.root.join("app/assets/images/cosmetic#{n}.jpg").open,
             category_id: rand(1..5),
             trademark_id: rand(1..5),
             description: des)
end

5.times do |n|
  type = "Payment type #{n+1}"
  des = "Payment for user"
  Payment.create! payment_type: type, description: des
end

User.create! name: "Admin",
             email: "admin@example.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "1/1/1991",
             role: 1,
             payment_id: 1


20.times do |n|
  name  = FFaker::Name.name
  User.create! name: name,
               email: "user#{n+1}@example.com",
               password: "111111",
               password_confirmation: "111111",
               dob: "1/1/1991",
               payment_id: 1
end

User.create! name: "Admin1",
             email: "admin-1@example.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "1/1/1991",
             role: 1,
             payment_id: 1

User.create! name: "Admin2",
             email: "admin-2@example.com",
             password: "111111",
             password_confirmation: "111111",
             dob: "1/1/1991",
             role: 1,
             payment_id: 1


Place.create! name: 'Cosmeticstore', description: 'Cơ sở 1', latitude: '21.022983', longitude: '105.807902'

Place.create! name: 'CosmeticStore', description: 'Cơ sở 2', latitude: "35.7100627", longitude: '139.8085117'

25.times do |n, id|
  id = rand(1..10)
  Blog.create!  title: "Blog#{n+1} ve cuon sach cuc ky hay",
                description: "Blog#{n+1} : Nếu đã từng, bạn có nhớ tới những nỗi ám ảnh thời đại học luôn giày vò anh chàng Phương Mộc nhân vật chính “Đề Thi Đẫm Máu? Cái chết của cô bạn gái Trần Hy?? Vụ cháy của căn phòng ký túc 352?? Tất cả những quá khứ đó sẽ được bày mở trong cuốn tiểu thuyết",
                auth_link: "https://www.railstutorial.org/book/advanced_login",
                body: "Blog#{n+1} : Nếu đã từng, bạn có nhớ tới những nỗi ám ảnh thời đại học luôn giày vò anh chàng Phương Mộc nhân vật chính “Đề Thi Đẫm Máu? Cái chết của cô bạn gái Trần Hy?? Vụ cháy của căn phòng ký túc 352?? Tất cả những quá khứ đó sẽ được bày mở trong cuốn tiểu thuyết",
                user_id: id,
                author: User.find_by(id: id).name,
                date: Time.current
end

9.times do |n|
 User.find_by(id: n+1).like(Cosmetic.find_by id: 17)
end

10.times do |n|
 User.find_by(id: n+1).like(Cosmetic.find_by id: 16)
end

11.times do |n|
 User.find_by(id: n+1).like(Cosmetic.find_by id: 1)
end
