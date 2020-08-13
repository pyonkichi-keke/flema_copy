class Brand < ActiveHash::Base
  self.data = [
      {id: 1, name: 'NIKE'}, {id: 2, name: 'adidas'}, {id: 3, name: 'asics'},
      {id: 4, name: 'mizuno'}, {id: 5, name: 'umbro'}, {id: 6, name: 'puma'}
  ]
end