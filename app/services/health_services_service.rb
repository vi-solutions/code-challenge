# frozen_string_literal: true

require 'faraday'
require 'json'
require 'uri'

# faraday encodes the cql_filter POINT params which opengis doesn't seem to like
module Faraday
  module NestedParamsEncoder
    def self.escape(arg)
      arg
    end
  end

  module FlatParamsEncoder
    def self.escape(arg)
      arg
    end
  end
end

class HealthServicesService
  def self.sanitize_params(params)
    params.tr('^0-9|/.', '') # only captures digits and dot characters
  end

  def self.build_area_name_params(params)
    params = sanitize_params(params)
    {
      service: 'WFS',
      version: '1.0.0',
      request: 'GetFeature',
      typeName: 'pub:WHSE_ADMIN_BOUNDARIES.BCHA_CMNTY_HEALTH_SERV_AREA_SP',
      srsname: 'EPSG:4326',
      cql_filter: "INTERSECTS(SHAPE,SRID=4326;POINT(#{params[:lng]}#{params[:lat]}))",
      propertyName: 'CMNTY_HLTH_SERV_AREA_CODE,CMNTY_HLTH_SERV_AREA_NAME',
      outputFormat: 'application/json'
    }
  end

  def self.area_name(params = {}, ip_address)
    return nil if !params[:lat] || !params[:lng]

    req_resp = Faraday.get(OPENMAPS_URI, build_area_name_params(params))
    body = JSON.parse req_resp.body
    if body['features']&.present?
      HealthServicesApiRequest.create(lat: params[:lat], lng: params[:lng], status: '200', ip_address: ip_address)
      body['features'][0]['properties']
    else
      { 'LAT_LNG_NOT_WITHIN_BC': true }
    end
  end
end
