FactoryGirl.define do
  factory :user do
    
  end
  factory :favorite do
    cat_id 1
    thing "MyString"
  end
  factory :cat do
    name "MyString"
    photo "MyString"
    likes 1
  end
end
