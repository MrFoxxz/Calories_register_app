class CaloriesRegistersController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @calories_register = CaloriesRegister.new
    end

    def show
    end

    def index
        @calories_registers = current_user.calories_registers.page params[:page]
    end

    def create
        @calories_register = current_user.calories_registers.build(calories_register_params)
        if @calories_register.save
            flash[:success] = 'Tus actividades ha sido registradas con exito!'
            redirect_to calories_registers_path
        else
            flash.now[:danger] = 'Informacion invalida'
            redirect_to new_calories_register_path
        end
    end

    private

    def calories_register_params
        params.require(:calories_register).permit(:calories, :description, :calories_action, :date)
    end
    
  end
  