require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  let(:fields) { %w[name city sector] }
  it 'return companies' do
    VCR.use_cassette 'companies' do
      response = Kemal::Service.get 'companies'
      expect(response.first.keys).to match_array(fields)
    end
  end
end
