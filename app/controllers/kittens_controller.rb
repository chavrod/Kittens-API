class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:notice] = 'New kitten created'
      redirect_to @kitten
    else
      flash.now[:alert] = 'Err...no new kitty...try again'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = 'Kitten updated'
      redirect_to @kitten
    else
      flash.now[:alert] = 'Error! Kitten not updated!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end