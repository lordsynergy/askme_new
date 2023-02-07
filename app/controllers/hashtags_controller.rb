class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(params[:name])
  end
end
