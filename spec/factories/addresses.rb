FactoryBot.define do

  factory :address do
    user_id               {"1"}
    postal_code           {"000-0000"}
    prefecture_id         {"1"}
    city                  {"hoge"}
    address               {"hoge"}
    apartment             {"hoge"}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"たろう"}       
    last_name_kana        {"やまだ"}  
    tel                   {"1111111111"}  
  end

end