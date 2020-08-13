class Category < ActiveHash::Base
  self.data = [
      {id: 1, name: 'レディース'}, {id: 2, name: 'メンズ'}, {id: 3, name: 'ベビー・キッズ'},
      {id: 4, name: 'インテリア'}, {id: 5, name: '本'}, {id: 6, name: 'ホビー'},
      {id: 7, name: 'コスメ・美容'}, {id: 8, name: '家電'}, {id: 9, name: 'スポーツ・レジャー'},
      {id: 10, name: 'ハンドメイド'}, {id: 11, name: 'チケット'}, {id: 12, name: 'その他'},
  ]
end