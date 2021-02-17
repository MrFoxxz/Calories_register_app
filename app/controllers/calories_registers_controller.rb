class CaloriesRegistersController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @calories_register = CaloriesRegister.new
    end

    def index
        @calories_registers = current_user.calories_registers
    end

    def create
        @calories_register = current_user.calories_registers.build(calories_registers_params)
        if @calories_register.save
            redirect_to 'index'
        else
            redirect_to 'new'
        end
    end

    private

    def record_params
        params.require(:calories_registers).permit(:calories, :description, :calories_action, :date)
    end
    
  end
  