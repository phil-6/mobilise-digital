class FilesController < ApplicationController
  before_action :authenticate_user!

  def download_self_assessment_form
    send_file(
        "#{Rails.root}/public/documents/Self_Assessment_Form.pdf",
        filename: "Self_Assessment_Form.pdf",
        type: "application/pdf"
    )
  end

end