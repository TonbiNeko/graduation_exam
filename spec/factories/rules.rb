FactoryBot.define do
  factory :rule do
    comment { 'Factory_rule1' }
    place_id { Place.first.id}
  end
  factory :second_rule, class: Rule do
    comment { 'Factory_rule2' }
    place_id { Place.last.id}
  end
end