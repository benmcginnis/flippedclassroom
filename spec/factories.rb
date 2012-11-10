FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    section 1

    factory :admin do
      admin true
      section 0
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :lesson do
    sequence(:name) { |n| "Lesson #{n}" }
  end
end