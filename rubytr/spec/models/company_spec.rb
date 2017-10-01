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
require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'Validations' do
    %i[name city sector].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end
end
