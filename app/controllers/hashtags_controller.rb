class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by!(name: params[:name].downcase)

    if @hashtag.questions.empty?
      raise ActionController::RoutingError.new('Not Found')
    else
      @hashtag
    end
  end
end
