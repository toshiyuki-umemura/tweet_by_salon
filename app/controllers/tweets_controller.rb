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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      if @tweet.update(tweet_params)
        flash[:notice] = "投稿を更新しました"
        redirect_to root_path
      else
        render :edit
      end
    else
      render :index
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      if @tweet.destroy
        flash[:notice] = "投稿を削除しました"
        redirect_to root_path
      else
        render :index
      end
    else
      redirect_to root_path
    end
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(
        :title,
        :text,
        :image,
        tag_attributes: [:id, :tag],
    )
  end
end
