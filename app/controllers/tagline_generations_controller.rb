class TaglineGenerationsController < ApplicationController
  def generate
    text_completion = OpenAi::TextCompletor.call("Write a tagline for #{params[:content]}", top_p: params[:top_p], temperature: params[:temperature], user: current_user)
    render json: { success: text_completion[:success], tagline: text_completion[:message] }
  end
end
