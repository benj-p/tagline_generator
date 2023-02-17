class OpenAi::Base < ApplicationService
  DEFAULT_SETTINGS = {
    model: 'text-davinci-003',
    max_tokens: 30
  }.freeze

  def initialize(params = {})
    @client = OpenAI::Client.new
    @model = params[:model] || DEFAULT_SETTINGS[:model]
    @max_tokens = params[:max_tokens] || DEFAULT_SETTINGS[:max_tokens]
  end
end