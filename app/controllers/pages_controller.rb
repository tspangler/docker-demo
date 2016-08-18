class PagesController < ApplicationController
  def hello
    @greeting = params[:greeting] ? params[:greeting] : 'Hello'
    @pages = Page.all
  end
end
