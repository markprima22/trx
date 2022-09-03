module Api
    module V1
        class NominalsController < ApplicationController

            def index
                @nominals = Nominal.all 
                render json: @nominals
            end
            
            def show
                @nominal = Nominal.find(params[:id])
                render json: @nominal
            end

            def create
                @nominal = Nominal.new(nominal_params)

                if @nominal.save
                    render json: @Nominal
                else
                    render json: @nominal.errors, status: :unprocessable_entity
                end
            end
            
            def update
                @nominal = Nominal.find(params[:id])

                if @nominal.update(nominal_params)
                    render json: @nominal
                else 
                    render json: @nominal.errors, status: :unprocessable_entity
                end
            end

            def destroy 
                @nominal = Nominal.find(params[:id])

                if @nominal.present?
                    @nominal.destroy
                    render json: @nominal 
                else
                    render json: {error: 'the nominal is not found'}
                end
            end

            private
            def nominal_params  
                params.require(:nominal).permit(:username, :amount)
            end
            
        end
    end
end
