class SightingsController < ApplicationController
  def new
    @species = Species.find(params[:species_id])
    @sighting = @species.sightings.new
  end

  def create
    @species = Species.find(params[:species_id])
    @sighting = @species.sightings.new(sighting_params)
    if @sighting.save
      flash[:notice] = "Sighting added successfully!"
      redirect_to species_path(@species)
    else
      render :new
    end
  end

  def edit
    @species = Species.find(params[:species_id])
    @sighting = Sighting.find(params[:id])
  end

  def update
    @species = Species.find(params[:species_id])
    @sighting = Sighting.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to species_path(@species)
    else
      render :edit
    end
  end

  def destroy
    @species = Species.find(params[:species_id])
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    flash[:alert] = "Sighting destroyed"
    redirect_to species_path(@species)
  end

  private
    def sighting_params
      params.require(:sighting).permit(:date, :longitude, :latitude)
    end
end
