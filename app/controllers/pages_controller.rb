class PagesController < ApplicationController
  def home
    @videos =  Video.where(published: true)
  end
end
