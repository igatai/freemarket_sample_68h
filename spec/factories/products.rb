FactoryBot.define do

  factory :product do
    price                     {"3000"}
    delivery_method           {"クロネコヤマト"}
    payment                   {"購入者負担"}
    status                    {"中古"}
    condition                 {"新品"}
    content                   {"f彼女からの贈り物で〜"}
    name                      {"指輪"}
    created_at                {"2020-02-25 10:24:30"}
    updated_at                {"2020-02-25 10:24:30"}
  end

end