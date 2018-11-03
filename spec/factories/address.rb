FactoryGirl.define do

  factory :address do
    family_name           "安倍"
    first_name            "太郎"
    family_name_kana      "アベ"
    first_name_kana       "タロウ"
    postal_code           "123-4567"
    prefecture            "福井県"
    city                  "横浜市緑区"
    street_number         "伊勢丹2-2-2"
    building              "大原ビル509"
    telephone             "09012345678"
  end

end
