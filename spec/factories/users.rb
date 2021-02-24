FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'user_factory@example.com' }
    name { 'User_Factory' }
    password { 'factory' }
    password_confirmation { 'factory' }
    end
  factory :second_user, class: User do
    id { 2 }
    email { 'user_factory2@example.com' }
    name { 'User_Factory2' }
    password { 'factory' }
    password_confirmation { 'factory' }
  end
end