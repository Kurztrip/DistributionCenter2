require 'swagger_helper'

RSpec.describe 'distribution_centers', type: :request do

  path '/distribution_centers' do

    

  require "swagger_helper"      
      

#______________________________________________________________________________________________
    get('list distribution_centers') do
      tags "Distribution Centers"
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end


    
  #______________________________________________________________________________________________
  path "distribution_centers" do
    post "Create distribution_center" do       #Label
      tags "Distribution Centers"
      consumes "application/json"       #Recibe
      parameter name: :distribution_center, in: :body, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          latitude_location: { type: :number },
          longitude_location: { type: :number },
          total_space: { type: :number },
          available_space: { type: :number }
        },
        required: ["address","latitude_location","longitude_location","total_space,available_space"],
      }
response "201", "distribution center was created" do
        let(:distribution_center) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
        run_test!
      end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
    end
  end
   #______________________________________________________________________________________________

   <<-DOC
    post('create distribution_center_2') do

      response(200, 'successful') do
        let(address:) { "calle 195 45B"}
        let(latitude_location:) { 1.2 }
        let(longitude_location:) { 78.987 }
        let(total_space:) { 6000.0}
        let(available_space:) {1000.0} 

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

      run_test!
    end
         
    end
    DOC







#PATH VARIABLE


  path '/distribution_centers/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'


    
    get('show distribution_center') do
      tags "Distribution Centers"
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    <<-DOC
    patch('update distribution_center') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    DOC


    <<-DOC
    put('update distribution_center') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
    DOC



     #______________________________________________________________________________________________
  
     put('update distribution_center') do       #Label
      tags "Distribution Centers"
      consumes "application/json"       #Recibe
      parameter name: :distribution_center, in: :body, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          latitude_location: { type: :number },
          longitude_location: { type: :number },
          total_space: { type: :number },
          available_space: { type: :number }
        },
        required: ["address","latitude_location","longitude_location","total_space,available_space"],
      }
response "201", "distribution center was updated" do
        let(:distribution_center) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
        run_test!
      end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
   #______________________________________________________________________________________________



    delete('delete distribution_center') do
      tags "Distribution Centers"
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end

end