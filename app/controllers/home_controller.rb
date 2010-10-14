class HomeController < ApplicationController
  def index
    @timex5_homepage = Page.timex5_home
    @projects = Project.all_public
  end
end