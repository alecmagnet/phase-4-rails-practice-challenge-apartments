class ApartmentsController < ApplicationController
	wrap_parameters format: []

	# GET /apartments
	def index
		apartments = Apartment.all
		render json: apartments, status: :ok
	end

	# GET /apartments/:id
	def show
		apartment = find_apartment
		render json: apartment, status: :ok
	end

	# POST /apartments
	def create
		apartment = Apartment.create!(apartment_params)
		render json: apartment, status: :created
	end

	# PATCH /apartments/:id
	def update
		apartment = find_apartment
		apartment.update!(apartment_params)
		render json: apartment, status: :accepted
	end

	# DELETE /apartments/:id
	def destroy
		apartment = find_apartment
		apartment.destroy
		head :no_content
	end

	private

	def find_apartment
		Apartment.find(params[:id])
	end

	def apartment_params
		params.permit(:number)
	end
		
end
