class ResponseMessages
  def self.ping; MessageBuilder.new(message: 'I\'m Ping!', code: 10).info end
end

class MessageBuilder
  def initialize(params)
    @message = params.fetch(:message, '')
    @code = params.fetch(:code, 0)
  end

  def messages
    [{ message: I18n.t("v1.#{@message}"), code: @code }]
  end

  def errors
    { errors: messages }
  end

  def info
    { info: messages }
  end
end
