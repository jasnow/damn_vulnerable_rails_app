class WelcomeController < ApplicationController
  def home
  end

  def add
    current_user.update_attribute(:money, (current_user.money+1))
  end

  def charity
    current_user.update_attribute(:money, 0)
  end

  def discover
    email = params[:email]
    @money = User.where("email = '#{email}'").first.money
  end
end
