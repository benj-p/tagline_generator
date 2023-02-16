class OpenAi::TextCompletor < OpenAi::Base
  def initialize(content, params = {})
    super(params)
    @content = content
    @temperature = params[:temperature].to_i || 1
    @top_p = params[:top_p].to_i || 0.8
  end

  def call
    begin
      completions = @client.completions(
        parameters: {
            model: @model,
            prompt: @content,
            max_tokens: @max_tokens,
            temperature: @temperature,
            top_p: @top_p,
            frequency_penalty: 0,
            presence_penalty: 0
        })
      success = completions['choices'].present?
      message = success ? completions['choices'].first['text'].strip : nil
    rescue
      # TODO: Log errors
      success = false
    end
      
    { success: success, message: message }
  end
end