class PagesController < ApplicationController
  def home
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
