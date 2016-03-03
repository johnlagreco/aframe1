class StaticPagesController < ApplicationController
  def home
  	@user = User.new
  end

  def about
  end

  def search
  end

  def contact
  end
end
