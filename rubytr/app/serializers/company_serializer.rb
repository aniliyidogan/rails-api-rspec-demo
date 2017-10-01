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

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :sector
end
