# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.new
    @tweet.build_tag
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/")
    else
      render("tweets/new")
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(
        :title,
        :text,
        tag_attributes: [:id, :tag]
    )
  end
end
