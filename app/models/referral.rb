class Referral < ApplicationRecord

  # model association
  belongs_to :user


  # validations
  validates_presence_of :user_id,
                        :email
end