class PagesController < ApplicationController
  def home
    if params[:query].present?
      @offers = Offer.search_by_offer(params[:query])
      @test = 1
    else
      @offers = Offer.all
    end
    @markers = []

    @offers.each do |offer|
      marker = {
        lat: offer.user.latitude,
        lng: offer.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {offer: offer})
      }
      @markers << marker
    end
    @markers
  end

  def map
    @offers = Offer.all
    @markers = []

    @offers.each do |offer|
      marker = {
        lat: offer.user.latitude,
        lng: offer.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {offer: offer})
      }
      @markers << marker
    end
    @markers
  end
end
