# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :politician do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    nickname "MyString"
    state nil
    in_office false
    gender "MyString"
    senate_class 1
    birthday "2013-06-18"
    govtrack_id 1
    seniority false
    name_suffix "MyString"
  end
end
