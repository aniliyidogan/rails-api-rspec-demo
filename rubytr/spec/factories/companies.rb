# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  sector     :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    sector Faker::Commerce.department(1)
    city Faker::Address.city
  end
end
