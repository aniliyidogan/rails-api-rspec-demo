require 'rails_helper'

RSpec.describe V1::CompaniesController, type: :request do
  describe '#index' do
    let(:fields) { %w[id name city sector] }
    let(:company) { create(:company) }

    def request
      get '/v1/companies', headers: header_with_token
    end

    before do
      company
      allow(Kemal::Service).to receive(:get).with('companies')
    end

    context 'return' do
      it '200' do
        request
        expect(response).to have_http_status(200)
      end

      it 'companies' do
        request
        expect(json.first.keys).to match_array(fields)
      end
    end
  end
end
