class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ウォーキング' },
    { id: 3, name: 'スクワット' },
    { id: 4, name: '腹筋' },
    { id: 5, name: '背筋' },
    { id: 6, name: '腕立て伏せ' },
    { id: 7, name: '水泳' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
  end