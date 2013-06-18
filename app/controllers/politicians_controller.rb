class PoliticiansController < ApplicationController
  def index
    @senators = Chamber.find_by_name('Senate').politicians
    @reps = Chamber.find_by_name('House of Representatives').politicians
  end
  def show
    @politician = Politician.find(params[:id])
  end
  def edit
    @politician = Politician.find(params[:id])
  end
  def update
    @politician = Politician.find(params[:id])
    if @politician.update_attributes(params[:politician])
      redirect_to politicians_path
    else
      render :edit
    end
  end
end