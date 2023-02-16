class PagesController < ApplicationController
  def home
  end

  def generate_tagline
    text_completion = OpenAi::TextCompletor.call("Write a tagline for #{params[:content]}", top_p: params[:top_p], temperature: params[:temperature])
    render json: { success: text_completion[:success], tagline: text_completion[:message] }
  end
end