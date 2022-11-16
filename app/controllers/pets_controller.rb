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
    @pet = Pet.new
    @pet.name = params.fetch("query_name")
    @pet.age = params.fetch("query_age")
    @pet.species_id = params.fetch("query_species_id")

    if @pet.valid?
      @pet.save
      redirect_to("/pets", { :notice => "Pet created successfully." })
    else
      # redirect_to("/pets/new", { :alert => @pet.errors.full_messages.to_sentence })

      render("new")
    end
  end

  def update
    # @pet = Pet.find(params.fetch("id"))

    @pet.name = params.fetch("query_name")
    @pet.age = params.fetch("query_age")
    @pet.species_id = params.fetch("query_species_id")

    if @pet.valid?
      @pet.save
      redirect_to("/pets/#{@pet.id}", { :notice => "Pet updated successfully."} )
    else
      redirect_to("/pets/#{@pet.id}", { :alert => @pet.errors.full_messages.to_sentence })
    end
  end

  def destroy
    # @pet = Pet.find(params.fetch("id"))

    @pet.destroy

    redirect_to("/pets", { :notice => "Pet deleted successfully."} )
  end
end
