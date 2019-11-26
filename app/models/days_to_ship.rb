class DaysToShip < ActiveHash::Base
  self.data = [
    {id: 1, name: '１〜2日で発送'},
    {id: 2, name: '２〜3日で発送'}, 
    {id: 3, name: '４〜7日で発送'},
  ]
end
