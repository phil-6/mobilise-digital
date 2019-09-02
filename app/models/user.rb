class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  has_many :job_applications, foreign_key: :user_id


  VALID_KEYWORDS = %w(agile_coach business_analyst communications_manager content_designer cyber_security data_architect data_engineer data_scientist delivery_manager designer developer performance_analyst portfolio_manager product_manager programme_manager quality_assurance service_manager technical_architect user_researcher web_operations_engineer)
  validate :validate_keywords

  private

  def validate_keywords
    if keywords?
      keywords.each do |keyword|
        unless VALID_KEYWORDS.include? keyword
          errors.add(:keywords, "'#{keyword}' is not a valid keyword")
        end
      end
    end
  end

end
