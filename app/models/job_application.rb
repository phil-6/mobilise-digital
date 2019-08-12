class JobApplication < ApplicationRecord

  # model association
  belongs_to :job
  belongs_to :user

  # validations
  validates_presence_of :user_id,
                        :job_id,
                        :cover
end