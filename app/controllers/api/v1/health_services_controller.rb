# frozen_string_literal: true

module Api
  module V1
    class HealthServicesController < ApplicationController
      def area_name
        render json: HealthServicesService.area_name(params, request.remote_ip)
      end
    end
  end
end
