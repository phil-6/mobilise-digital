class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:main, :map]
  def main
    render template: "pages/main"
  end

  def dashboard
    @jobs = Job.all.order(:updated_at).where(:open => false).first(6)
  end

end
