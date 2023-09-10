class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    videos_path
  end
end
