class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.joins(:questions).distinct.find_by!(name: params[:name].downcase)
  end
end
