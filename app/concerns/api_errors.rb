module ApiErrors
  extend ActiveSupport::Concern

  private

  def error_response(error_messages, status)
    errors = ErrorSerializer.from_messages(error_messages)

    status status
    json errors
  end
end
