class StaticPagesController < ApplicationController
  def home
  	fresh_when(current_user)
  end

  def help
  	fresh_when(current_user)
  end

  def about
  	fresh_when(current_user)
  end

  def contact
  	fresh_when(current_user)
  end
end
