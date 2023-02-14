class OpenAi::TextCompletor < OpenAi::Base
  def initialize(content, params = {})
    super(params)
    @content = content
  end

  def call
    completions = @client.completions(
      parameters: {
          model: @model,
          prompt: @content,
          max_tokens: @max_tokens,
          temperature: 1,
          top_p: 0.8,
          frequency_penalty: 0,
          presence_penalty: 0
      })
      
      {
        success: completions['choices'].present?,
        tagline: completions['choices'].present? ? completions['choices'].first['text'].strip : nil
      }
  end
end