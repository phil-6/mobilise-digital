class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:main, :map]
  def main
    render template: "pages/main"
  end


end
