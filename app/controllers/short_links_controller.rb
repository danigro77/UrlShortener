class ShortLinksController < ApplicationController
  respond_to :json

  def shorten_url
    short_link = ShortLink.find_or_create_by({original: params[:original_url]})
    render json: short_link
  end

end