class User
  include ActiveModel::Model
  # attr_accessor :title, :body
  attr_accessor :name, :email, :gender, :age, :agreement
  
  validates :name, presence: true
  validates :email, presence: true
  validates :gender, inclusion: { in: %w(0 1) }
  validates :age, presence: true
  validates :agreement, acceptance: true

end

# 参考
# [Railsのvalidationメッセージを日本語化する。 \- とあるエンジニアのブログ](http://sonedayuya.hatenablog.com/entry/2014/01/27/011229)
# [Rails: フォームのエラーが出た欄を、Bootstrapを使ってスタイリングする方法 \- tkymtk's blog](http://tkymtk.hatenablog.com/entry/2013/12/16/183721)

class ValidationController < ApplicationController
  
  def form
    if request.request_method == 'GET'
      @test = '0'
      @user = User.new
    else
      user = User.new(user_params)
      if user.valid?
        redirect_to validation_form_path
        return
      else
        @info = "入力内容に誤りがあります"
        @user = user
        render 'form'
      end
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :gender, :age, :agreement)
  end
  
end
