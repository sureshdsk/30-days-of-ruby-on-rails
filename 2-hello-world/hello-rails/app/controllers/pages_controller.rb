class PagesController < ApplicationController
  def home
    @message = "Hello Rails!"
  end

  def about
    @message = "This is Hello Rails App!"
  end
end
