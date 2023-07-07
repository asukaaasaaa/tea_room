# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@example.com',
  password: 'admin1'
)

Customer.create!(
  [
    {
      name: 'テストユーザー1',
      introduction: 'こんにちは',
      email: 'mail@com',
      password: '111111',
      is_deleted: false
    },
    {
      name: 'テストユーザー2',
      introduction: 'よろしくお願いします',
      email: 'test@com',
      password: '111111',
      is_deleted: false
    },
    {
      name: 'テストユーザー3',
      introduction: 'こんにちは〜〜',
      email: 'test1@com',
      password: '111111',
      is_deleted: false
    }
  ]
)

Genre.create!(
  [
    {
      name: '日本茶'
    },
    {
      name: '紅茶'
    },
    {
      name: '中国茶'
    },
    {
      name: 'その他'
    }
  ]
)