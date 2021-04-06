#require 'swagger_helper'

#RSpec.describe 'api/v1/distribution_centers', type: :request do
#end

require "swagger_helper"
RSpec.describe "distribution_centers_controller", type: :request do
  path "distribution_centers" do
    post "Create an Encounter" do       #Label
      tags "Distribution Centers"
      consumes "application/json"       #Recibe
      parameter name: :distribution_center, in: :body, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          latitude_location: { type: :float },
          longitude_location: { type: :float },
          total_space: { type: :float },
          available_space: { type: :float }
        },
        required: ["address","latitude_location","longitude_location","total_space,available_space"],
      }
response "201", "encounter created" do
        let(:distribution_center) { {     
            "address" : "calle 195 45B",
            "latitude_location" : 1.2,
            "longitude_location" : 78.987,
            "total_space":6000.0,
            "available_space":1000.0 } }
        run_test!
      end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
    end
  end
end