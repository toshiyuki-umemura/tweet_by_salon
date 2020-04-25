# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @tweets = Tweet.search(params[:search]).page(params[:page]).per(5)
  end

end
