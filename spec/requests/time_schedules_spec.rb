require 'swagger_helper'

RSpec.describe 'time_schedules', type: :request do

  path '/time_schedules' do
    
    get('list time_schedules') do
      tags "Time Schedules"
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
  post "Create time_schedule" do       #Label
    tags "Time Schedules"
    consumes "application/json"       #Recibe
    parameter name: :time_schedule, in: :body, schema: {
      type: :object,
      properties: {
        title: { type: :string },
        description: { type: :string },
        distribution_center_id: { type: :integer },
      },
      required: ["title", "description", "distribution_center_id"],
    }
response "201", "created" do
      #let(:time_schedule) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
      let(:time_schedule){ {title: "Horario de operaciones 2021-I", description: "horario laboral 2021 semestre 1 empresa de logistica", distribution_center_id: 1} }
      run_test!
    end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
 #______________________________________________________________________________________________



    
 <<-DOC
    post('create time_schedule2') do
      tags "Time Schedules"
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
  DOC


  end
  

  path '/time_schedules/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'


   

    get('show time_schedule') do
      tags "Time Schedules"
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
    patch('update time_schedule') do
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
    put('update time_schedule') do
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
  put "Update time_schedule" do       #Label
    tags "Time Schedules"
    consumes "application/json"       #Recibe
    parameter name: :time_schedule, in: :body, schema: {
      type: :object,
      properties: {
        title: { type: :string },
        description: { type: :string },
        distribution_center_id: { type: :integer },
      },
      required: ["distribution_center_id"],
    }
response "200", "successful" do
      #let(:time_schedule) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
      let(:time_schedule){ {title: "Horario actualizado 2021-I", description: "horario laboral 2021 semestre 1 empresa de logistica", distribution_center_id: 1} }
      run_test!
    end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
 #______________________________________________________________________________________________

 

    delete('delete time_schedule') do
      tags "Time Schedules"
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
