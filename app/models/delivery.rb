class Delivery < ActiveHash::Base
  self.data = [
      {id: 1, name: '送料込'}, {id: 2, name: '着払い'}
  ]
end