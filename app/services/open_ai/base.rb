class OpenAi::Base < ApplicationService
  def initialize(params = {})
    @client = OpenAI::Client.new
    @model = params[:model] || 'text-davinci-003'
    @max_tokens = params[:max_tokens] || 20
  end
end