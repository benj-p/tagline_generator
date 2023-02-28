class OpenAi::TextCompletor < OpenAi::Base
  DEFAULT_SETTINGS = {
    temperature: 1,
    top_p: 0.8
  }.freeze

  def initialize(content, params = {})
    super(params)
    @content = content
    @temperature = params[:temperature].to_i || DEFAULT_SETTINGS[:temperature]
    @top_p = params[:top_p].to_i || DEFAULT_SETTINGS[:top_p]
  end

  def call
    begin
      response = @client.completions(parameters: set_params)
      success = response.code == 200
      message = success ? response['choices']&.first&.dig("text")&.strip : nil
    rescue
      success, message = false, nil
    end
    
    TaglineGeneration.create(parameters: set_params, response: response)
    { success: success, message: message }
  end

  private

  def set_params
    {
      model: @model,
      prompt: @content,
      max_tokens: @max_tokens,
      temperature: @temperature,
      top_p: @top_p,
      frequency_penalty: 0,
      presence_penalty: 0
    }
  end
end