class User
  include ActiveModel::Model
  attr_accessor :name, :age, :sex

  # validates :title, :body, presence: true
  #
  # def save
  #   return false if invalid?
  #   AdminMailer.feedback(params[:title], params[:body]).deliver_later
  #   true
  # end

  # enum is not available.
  # enum sex: { male: 0, female: 1 }
  def get_sex_type
    sex == 0 ? 'male' : 'female'
  end
end

class FormController < ApplicationController
  def input
    @user = User.new
  end

  def output
    @user = User.new(user_params)

    flash[:notice] = 'これはnoticeです。'
    flash[:alert]  = 'これはalertです。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :sex)
  end
end
