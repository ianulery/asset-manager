class PeopleController < ApplicationController
	before_action :find_person, except: [:index, :new, :create]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      render :new
    end   
  end

  def edit
    render :new
  end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      render :new
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

	private

  def find_person
    @person = Person.find(params[:id])
  end

	def person_params
		params.require(:person).permit(
      :email,
      :first_name,
      :last_name
    )
	end
end
