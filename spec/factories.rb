FactoryGirl.define do
  factory :user do
    name     "Marco Le Foll"
    email    "marc@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end