require 'rails_helper'

RSpec.describe OpenAi::TextCompletor, type: :model do
  describe '#call' do
    let(:text_completion) { OpenAi::TextCompletor.call("Write a tagline for an ice cream shop") }
    
    it 'returns a hash with success and message' do
      expect(text_completion).to be_a_kind_of(Hash)
      expect(text_completion).to have_key(:success)
      expect(text_completion).to have_key(:message)
    end

    it 'returns the correct response for "Write a tagline for an ice cream shop"' do
      expect(text_completion[:success]).to be(true)
      expect(text_completion[:message]).to be_a_kind_of(String)
    end
  end
end