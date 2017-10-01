class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access

  # @return [JSON] ping
  def ping; end

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, _options|
      token == ENV['TOKEN']
    end
  end

  def render_response_message(message, code)
    render json: ResponseMessages.send(message), status: code
  end
end
