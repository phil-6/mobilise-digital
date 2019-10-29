class FilesController < ApplicationController
  before_action :authenticate_user!

  def download_self_assessment_form
    send_file(
        "#{Rails.root}/public/documents/Self_Assessment_Form.pdf",
        filename: "Self_Assessment_Form.pdf",
        type: "application/pdf"
    )
  end

  def download_wol_guide
    if valid_document?
      send_file(
          "#{Rails.root}/public/documents/working_out_loud/WOL-guide-#{params[:id]}.pdf",
          filename: "WOL-Guide-#{params[:id]}.pdf",
          type: "application/pdf"
      )
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_document?
    File.exist?(Pathname.new("#{Rails.root}/public/documents/working_out_loud/WOL-guide-#{params[:id]}.pdf"))
  end

end