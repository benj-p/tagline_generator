class PagesController < ApplicationController
  def home
  end

  def generate_tagline
    text_completion = OpenAi::TextCompletor.call("Write a tagline for #{params[:content]}")
    render json: { success: text_completion[:success], tagline: text_completion[:tagline] }
  end
end