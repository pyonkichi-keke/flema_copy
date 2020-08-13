FactoryBot.define do
  factory :user do
    nickname              {"hoge"}
    email                 {"hoge@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"たろう"}       
    last_name_kana        {"やまだ"}  
    birthday              {"20200101"}  
  end
end