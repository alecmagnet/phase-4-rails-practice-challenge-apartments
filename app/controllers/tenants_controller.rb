class TenantsController < ApplicationController
	wrap_parameters format: []

	# GET /tenants
	def index
		tenants = Tenant.all
		render json: tenants, status: :ok
	end

	# GET /tenants/:id
	def show
		tenant = find_tenant
		render json: tenant, status: :ok
	end

	# POST /tenants
	def create
		tenant = Tenant.create!(tenant_params)
		render json: tenant, status: :created
	end

	# PATCH /tenants/:id
	def update
		tenant = find_tenant
		tenant.update!(tenant_params)
		render json: tenant, status: :accepted
	end

	# DELETE /tenants/:id
	def destroy
		tenant = find_tenant
		tenant.destroy
		head :no_content
	end

	private

	def find_tenant
		Tenant.find(params[:id])
	end

	def tenant_params
		params.permit(:name, :age)
	end
		
end
