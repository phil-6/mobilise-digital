class Job < ApplicationRecord

      # model association
  has_many :job_applications, dependent: :destroy, foreign_key: :job_id

  # validations
  validates_presence_of :title,
                        :description,
                        :keywords,
                        :published_date,
                        :latest_start_date,
                        :award_date,
                        :contract_length,
                        :day_rate

  VALID_KEYWORDS = %w(agile_coach business_analyst communications_manager content_designer cyber_security data_architect data_engineer data_scientist delivery_manager designer developer performance_analyst portfolio_manager product_manager programme_manager quality_assurance service_manager technical_architect user_researcher web_operations_engineer)
  validate :validate_keywords


  # :keywords, inclusion: {
  #     in:%w(agile_coach business_analyst communications_manager content_designer cyber_security data_architect data_engineer data_scientist delivery_manager designer developer performance_analyst portfolio_manager product_manager programme_manager quality_assurance service_manager technical_architect user_researcher web_operations_engineer),
  #     message: "%{value} is not a valid keyword" }

  private

  def validate_keywords
    keywords.each do |keyword|
      unless VALID_KEYWORDS.include? keyword
        errors.add(:keywords, "'#{keyword}' is not a valid keyword")
      end
    end
  end

end