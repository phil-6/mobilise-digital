class ReferralsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: :create

  # POST /referrals
  def create
    if User.exists?( email: params[:referral][:email])
      flash[:alert] = 'This member already exists.'
    elsif Referral.exists?(email: params[:referral][:email])
      flash[:alert] = 'This member has already been referred.'
    elsif @user.referrals.create!(referral_params)
      ApplicationMailer.referral_email(referral_params, @user).deliver_now
      flash[:notice] = 'Congratulations! We\'ll send them an email with an invitation'
    end
    redirect_to '/dashboard'
  end

  private

  def set_user
    @user = current_user
  end

  def referral_params
    params.require(:referral).permit(:user_id,
                                     :email)
  end

end
