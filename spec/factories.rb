FactoryBot.define do

  factory :card do
    name_card {"Fernando"}
    number_bin {"123"}
    number_card {"4111111111111111"}
    expiration_date {"20/18"}
    schema {"DEBIT"}
    mark_card {"MasterCard"}
  end
end
