class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:main, :map]
  def main
    render template: "pages/main"
  end

  # def about
  #   render template: "pages/_about"
  # end



  # def how_to
  #   render template: "pages/_how_to"
  # end
  #
  # def map
  #   render template: "pages/map"
  # end


end
