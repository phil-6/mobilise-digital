class Job < ApplicationRecord

  # model association
  has_many :job_applications, dependent: :destroy, foreign_key: :job_id

  # validations
  validates_presence_of :title,
                        :description

end