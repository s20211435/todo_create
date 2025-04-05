# スーパーユーザーの作成
admin_email = "admin@example.com"
admin_password = "password123"

if User.exists?(email: admin_email)
  puts "スーパーユーザーは既に存在します: #{admin_email}"
else
  User.create!(
    email: admin_email,
    password: admin_password,
    password_confirmation: admin_password,
    admin: true
  )
  puts "スーパーユーザーを作成しました: #{admin_email}"
end