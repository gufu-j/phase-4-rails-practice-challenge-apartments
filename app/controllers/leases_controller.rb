class LeasesController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def create
        lease = Lease.create!(leases_params)
        render json: lease, status: :created
    end

    def destroy 
        lease = find_lease
        lease.destroy
        head :no_content
    end

   private 

   def find_lease 
    Lease.find(params[:id])
   end

   def leases_params
    params.permit(:rent, :apartment_id, :tenant_id)
   end

   def render_unprocessable_entity_response(invalid) 
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
   end

end
