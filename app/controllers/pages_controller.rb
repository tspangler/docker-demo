class PagesController < ApplicationController
  def hello
    @greeting = params[:greeting] ? params[:greeting] : 'Hello'
  end
end
