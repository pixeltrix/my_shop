FactoryGirl.define do
  factory :user do
    name  "Bob Jones"
    email "bob.jones@example.com"
    password "notasecret"
    password_confirmation "notasecret"
    confirmed_at 2.months.ago

    trait :admin do
      name "Administrator"
      email "admin@example.com"
      admin true
    end
  end
end
