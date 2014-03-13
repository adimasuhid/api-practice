FactoryGirl.define do

  factory :user do
    email "12345@sample.com"
    password SecureRandom.hex 10
    password_confirmation { password }
  end

end
