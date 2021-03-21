class Api::V1::HealthServicesController < ApplicationController
  def get_area_name
    render json: HealthServicesService.get_area_name(params, request.remote_ip)
  end
end
