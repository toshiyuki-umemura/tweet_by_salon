# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @tweets = Tweet.all
  end
end
