FactoryBot.define do
  factory :place do
    email { 'place_factory@example.com' }
    name { 'Place_Factory' }
    address { '東京都' }
    description { 'Factoryで作ったデフォルトのディスクリプション１' }
  end
  factory :second_place, class: Place do
    email { 'place_factory2@example.com' }
    name { 'Place_Factory2' }
    address { '神奈川県' }
    description { 'Factoryで作ったデフォルトのディスクリプション２' }
  end
end