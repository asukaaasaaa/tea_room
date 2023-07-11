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
      introduction: 'こんにちは！色々なお茶を試しています。',
      email: 'mail@com',
      password: '111111',
      is_deleted: false
    },
    {
      name: 'テストユーザー2',
      introduction: '珍しいお茶も大好きです。よろしくお願いします。',
      email: 'test@com',
      password: '111111',
      is_deleted: false
    },
    {
      name: 'テストユーザー3',
      introduction: 'こんにちは〜〜！紅茶が好きです！よろしくお願いします。',
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

PostTea.create!(
  [
    {
      customer_id:1,
      genre_id: 2,
      title: 'ニルギリ',
      body:
        %Q{2023年の春摘み紅茶だそうです！\n香りが芳醇でまろやかな味わいでした。レモンティーにしても楽しめそうです〜},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post1.jpg"),filename: "post1.jpg")
    },
    {
      customer_id:2,
      genre_id: 1,
      title: 'はるもえぎ',
      body:
        %Q{熱湯でいれても渋みが出ないし、後味もさっぱりしているので緑茶は飲み慣れない方やごくごく飲みたい日方にもおすすめです！},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post2.jpg"),filename: "post2.jpg")
    },
    {
      customer_id:3,
      genre_id: 1,
      title: '宇治田原 あさひ',
      body:
        %Q{点ててよし、料理にもよしの、気軽に使えるお抹茶です。\nカテキン、ビタミンＥを多く含んでいるので、毎日飲むようにしています！},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post3.jpg"),filename: "post3.jpg")
    },
    {
      customer_id:1,
      genre_id: 1,
      title: '藤枝 やぶきた',
      body:
        %Q{2ふくよかですっきりとした飲み口です！\n湯冷まししたお湯でじっくりといれることにより、甘み・旨みが浸出されやすいのでおすすめです。},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post4.jpg"),filename: "post4.jpg")
    },
    {
      customer_id:2,
      genre_id: 2,
      title: '深炒り玄米麦茶',
      body:
        %Q{アイスティーにして飲みました〜\n深炒りした玄米、チコリ、はと麦などが入っていて、ノンカフェインなので飲みやすかったです。},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post5.jpg"),filename: "post5.jpg")
    },
    {
      customer_id:3,
      genre_id: 2,
      title: 'ダージリンでホームメイドアイスティー',
      body:
        %Q{最近流行りのホームメイドアイスティーです。\n手作りなら糖分も自分で調整できるので、ダイエット中の方や子供にも安心で美味しかったです！！},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post6.jpg"),filename: "post6.jpg")
    },
    {
      customer_id:1,
      genre_id: 2,
      title: 'オーガニック ルイボス',
      body:
        %Q{定番のルイボスティーです。\nカフェインを含まないので夏にゴクゴク飲める冷たいお茶として最高でした〜〜},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post7.jpg"),filename: "post7.jpg")
    },
    {
      customer_id:2,
      genre_id: 3,
      title: '凍頂 清香',
      body:
        %Q{熱湯を注いだ瞬間良い香りが広がりました。\n香ばしくてお茶菓子との相性もぴったりでした。},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post8.jpg"),filename: "post8.jpg")
    },
    {
      customer_id:3,
      genre_id: 2,
      title: 'ダージリン・ザ セカンドフラッシュ',
      body:
        %Q{紅茶のシャンパン」と称される、ダージリン夏摘みのみのブレンド。\nフルーティーで飲みやすかったです。},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post9.jpg"),filename: "post9.jpg")
    },
    {
      customer_id:1,
      genre_id: 4,
      title: 'アダージオ',
      body:
        %Q{グレープフルーツの香りとレモングラスをブレンドしたお茶。\nノンカフェインでリラックスできるので寝る前に飲んでいます。},
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/post11.jpg"),filename: "post11.jpg")
    },
  ]
)
