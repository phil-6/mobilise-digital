class ReferralsController < ApplicationController

  # POST /referrals
  def create
    if User.exists?(email: params[:email])
      flash[:alert] = 'This member already exists.'
    elsif Referral.exists?(email: params[:email])
      flash[:alert] = 'This member has already been referred.'
    elsif current_user.referrals.create!(referral_params)
      flash[:alert] = 'Congratulations! We\'ll send them an email with an invitation'
    end
  end



  private

  def referral_params
    params.require(:referral).permit(:user_id,
                                     :email)
  end

end
