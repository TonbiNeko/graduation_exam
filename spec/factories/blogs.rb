FactoryBot.define do
  factory :blog do
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    user_id { 1 }
  end
  factory :second_blog, class: Blog do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    user_id { 2 }
  end
end