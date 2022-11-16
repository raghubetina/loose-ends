class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :destroy, :update]

  def set_pet
    the_id = params.fetch("id")

    # The next two are identical

    # @pet = Pet.where(id: the_id).first # might return nil
    
    # @pet = Pet.find_by(id: the_id) # might return nil
    
    # The next two are identical

    # @pet = Pet.find_by!(id: the_id) # will never return nil
    # @user = User.find_by!(username: params.fetch("username"))
    
    @pet = Pet.find(the_id) # will never return nil
  end

  def new
    @pet = Pet.new
  end

  def edit
    # @pet = Pet.find(params.fetch("id"))
  end

  def index
    matching_pets = Pet.all

    @list_of_pets = matching_pets.order({ :created_at => :desc })

    respond_to do |format|
      format.html do
        render("pets/index.html.erb")
      end

      format.json do
        render json: @list_of_pets 
      end
    end
  end

  def show
    # @pet = Pet.find_by!(id: params.fetch("id"))

    # @pet = Pet.find(params.fetch("id"))

    # render({ :template => "pets/show.html.erb" })
    
    # render("pets/show.html.erb")
    
    # render("pets/show")

    # render("show")

    # if @pet == nil
    #   render(html: "not found", status: 404)
    # else
    #   render({ :template => "pets/show.html.erb" })
    # end
  end

  def create
    pet_params = params.require(:pet).permit(:age, :name, :species_id)
    
    @pet = Pet.new(pet_params)

    if @pet.valid?
      @pet.save

      redirect_to("/pets", { :notice => "Pet created successfully." })
    else
      render("new")
    end
  end

  def update
    # @pet = Pet.find(params.fetch("id"))

    pet_params = params.require(:pet).permit(:age, :name, :species_id)
    
    @pet.update(pet_params)

    if @pet.valid?
      redirect_to("/pets/#{@pet.id}", { :notice => "Pet updated successfully."} )
    else
      render("edit")
    end
  end

  def destroy
    # @pet = Pet.find(params.fetch("id"))

    @pet.destroy

    redirect_to("/pets", { :notice => "Pet deleted successfully."} )
  end
end
