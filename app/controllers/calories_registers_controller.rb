class CaloriesRegistersController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @calories_register = CaloriesRegister.new
    end

    def show
        @register = current_user.calories_registers.find(params[:id])
    end

    def index
        @calories_registers = current_user.calories_registers.page(params[:page])
    end

    def create
        @calories_register = current_user.calories_registers.build(calories_register_params)
        if @calories_register.save
            flash[:success] = 'Tus actividades ha sido registradas con exito!'
            redirect_to calories_registers_path
        else
            flash.now[:danger] = 'Informacion invalida'
            render new_calories_register_path
        end
    end

    def destroy
        current_user.calories_registers.find(params[:id]).destroy
        flash[:info] = 'Registro borrado'
        redirect_to calories_registers_path
    end

    def edit
        @calories_register = current_user.calories_registers.find(params[:id])
    end

    def update
        @calories_register = CaloriesRegister.find(params[:id])
        if @calories_register.update(calories_register_params)
         flash[:success] = 'Registro actualizado'
         redirect_to calories_registers_path
        else
         render edit
        end
       end

    private #------------------------------------------------------------------------------------------

    def calories_register_params
        params.require(:calories_register).permit(:calories, :description, :calories_action, :date)
    end
    
  end
  