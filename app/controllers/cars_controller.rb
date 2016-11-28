class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :destroy, :edit, :update, :new, :create]
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.select { |car| car.user_id == current_user.id }
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new

    # puts params[:user_id]
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    cp = car_params
    cp[:user_id] = current_user.id
    # cp[:lat] = @lat_lng[0];
    # cp[:long] = @lat_lng[1];
    @car = Car.new(cp)
    if @car.save
        flash[:success] = 'Car was successfully Located'
        redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    cp = car_params
    cp[:user_id] = current_user.id
    respond_to do |format|
      if @car.update(cp)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    if @car.user_id == current_user.id
      @car.destroy
      respond_to do |format|
        format.html { redirect_to user_path(current_user.id), notice: 'Car was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      raise ActionController::RoutingError.new('Forbidden')
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:user_id, :long, :lat, :name)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
