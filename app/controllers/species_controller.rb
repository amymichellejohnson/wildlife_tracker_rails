class SpeciesController <ApplicationController

  def index
    @species = Species.all
  end

  def show
    @species = Species.find(params[:id])
  end

  def new
    @species = Species.new
  end

  def create
    @species = Species.new(species_params)
    if @species.save
      flash[:notice] = "Species successfully added!"
      redirect_to species_index_path
    else
      render :new
    end
  end

  def edit
    @species = Species.find(params[:id])
  end

  def update
    @species = Species.find(params[:id])
    if @species.update(species_params)
      flash[:notice] = "Species successfully updated!"
      redirect_to species_index_path
    else
      render :edit
    end
  end

  def destroy
    @species= Species.find(params[:id])
    @species.destroy
    flash[:alert] = "Species deleted"
    redirect_to species_index_path
  end

  private
    def species_params
      params.require(:species).permit(:name)
    end
end
