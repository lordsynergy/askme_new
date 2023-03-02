class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.where_exists(:questions).find_by!(name: params[:name].downcase)
  end
end
