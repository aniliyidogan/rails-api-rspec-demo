module V1
  class CompaniesController < ApplicationController

=begin
  @api {get} /v1/companies Index
  @apiDescription list rubytr companies
  @apiVersion 0.1.0
  @apiGroup Companies
  @apiName Index

  @apiSuccessExample Success-Response:
  HTTP/1.1 200 Ok
  [
    {
        "id": 53,
        "name": "Altinci Cadde",
        "city": "İstanbul",
        "sector": "E-ticaret"
    },
    {
        "id": 54,
        "name": "Atatürk Üniversitesi",
        "city": "Erzurum",
        "sector": "Bilişim"
    }
  ]
=end
    def index
      sync_company
      load_companies
      render json: @companies
    end

    private

    def load_companies
      @companies = Company.order(name: :asc)
    end

    def sync_company
      Kemal::Service.get('companies')
    end
  end
end
