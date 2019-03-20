class ShortlinksController < ApplicationController
  def show
    @shortlink = Shortlink.find(params[:shortlink_id])
    if @shortlink.key == params[:shortlink_key]
      return redirect_to @shortlink.target
    end

    raise ActiveRecord::RecordNotFound
  end
end
