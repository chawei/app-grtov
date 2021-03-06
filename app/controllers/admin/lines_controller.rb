class Admin::LinesController < ApplicationController
  layout 'admin'
  before_filter :login_required, :check_access
  
  def index
    @lines = Line.custom
  end
  
  def show
    @line = Line.find(params[:id])
  end
  
  def new
    @line = Line.new
  end
  
  def create
    @line = Line.new(params[:line])
    if @line.save
      flash[:notice] = "Successfully created line."
      redirect_to [:admin, @line]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @line = Line.find(params[:id])
  end
  
  def update
    @line = Line.find(params[:id])
    if @line.update_attributes(params[:line])
      flash[:notice] = "Successfully updated line."
      redirect_to [:admin, @line]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "Successfully destroyed line."
    redirect_to admin_lines_url
  end
  
  private
  
  def check_access
    unless current_user.admin?
      flash[:notice] = "You don't have the access to this page."
      redirect_to admin_projects_path 
    end
  end
  
end
