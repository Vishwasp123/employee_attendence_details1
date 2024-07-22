class CompaniesController < ApplicationController
	before_action :set_company, only: %i[show edit update destroy]
	
	def index
		@companies = Company.all
	end

	def new 
		@company = Companies.new
	end

	def create
		@company = Companies.new(company_params)

		if @company.save
			redirect_to @company
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
	end

	def edit
	end

	def update
		if @company.update(company_params)
			redirect_to @company
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		if @company.destroy
			redirect_to root_path, status: :see_other
		else
			render @company.errors.messages
		end
	end

	private

	def set_company
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:article).permit(:name, :latitude, :longitude, :radius)
	end

end
