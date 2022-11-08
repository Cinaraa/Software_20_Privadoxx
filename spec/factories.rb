# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :user do
    association :publication
    association :review
    name { 'Francisco' }
    email { 'fpintov@uc.cl' }
    phone { '444999555' }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'client' }
  end
end

FactoryBot.define do
  factory :review do
    author { 'Felipe' }
    rating { 10 }
    content { 'Gran sprint, un 7' }
    association :user
    association :publication
  end
end

FactoryBot.define do
  factory :publication do
    title { 'Palos de golf' }
    sport { 'Golf' }
    description { 'Está en buen estado' }
    image { 'https://i.ebayimg.com/thumbs/images/g/40kAAOSwKgVi6By~/s-l300.jpg' }
    price { 25_500 }
    category { 'Palo' }
    association :user
    association :review
  end
end

FactoryBot.define do
  factory :request do
    title { 'Quiero una' }
    body { 'Me interesa mucho para mi cumpleaños' }
    association :user
    association :publication
  end
end
