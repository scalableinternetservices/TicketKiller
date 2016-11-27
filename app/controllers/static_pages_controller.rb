class StaticPagesController < ApplicationController
  def home
  	if (current_user)
  		fresh_when(current_user.id)
  	else 
  		fresh_when(true)
  	end
  end

  def help
  	if (current_user)
  		fresh_when(current_user.id)
  	else 
  		fresh_when(true)
  	end
  end

  def about
  	if (current_user)
  		fresh_when(current_user.id)
  	else 
  		fresh_when(true)
  	end
  end

  def contact
  	if (current_user)
  		fresh_when(current_user.id)
  	else 
  		fresh_when(true)
  	end
  end
end
