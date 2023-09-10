class VideosController < ApplicationController
  before_action :authenticate_user!
  def index
    @videos =  Video.all
  end
  def show
    @video = Video.find(params[:id])
    @user_video = @video.user_videos.build
  end
  def create
    @video = Video.find(params[:user_video][:video_id])
    @video.published = true
    @video.save!
    if params[:user_video][:user_id].present?
      params[:user_video][:user_id].each do |user|
        @user_video = @video.user_videos.build
        @user_video.user_id = user
        @user_video.content = params[:user_video][:content]
        @user_video.save!
      end
      redirect_to videos_path, notice: 'Share video success.' 
    else
      redirect_to video_path(@video), notice: 'Share video fail.' 
    end
  end
end
