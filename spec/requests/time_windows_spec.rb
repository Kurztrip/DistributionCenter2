require 'swagger_helper'

RSpec.describe 'time_windows', type: :request do

  path '/time_windows' do

    get('list time_windows') do
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


  <<-DOC
    post('create time_window') do
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
   #______________________________________________________________________________________________
   post "create time_window " do       #Label
    tags "Time Windows"
    consumes "application/json"       #Recibe
    parameter name: :time_window, in: :body, schema: {
      type: :object,
      properties: {
        beginning: { type: :string },
        ending: { type: :string },
        time_schdule_id: { type: :integer }
      },
      required: ["beginning", "ending", "time_schdule_id"],
    }
response "200", "successful" do
      #let(:time_schedule) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
      let(:time_window) { { beginning: "2022-03-29T00:00:00.000", ending: "2022-03-29T12:34:00.000", time_schedule_id: 1 } }
      run_test!
    end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
 #______________________________________________________________________________________________

  end

  path '/time_windows/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show time_window') do
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
    patch('update time_window') do
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
    put('update time_window') do
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

    delete('delete time_window') do
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

  path '/time_windows/everyday' do
    <<-DOC
    post('create_everyday_schdule time_window') do
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
     #______________________________________________________________________________________________
  post "create a set of time windows repeating from monday to friday" do       #Label
    tags "Time Windows"
    consumes "application/json"       #Recibe
    parameter name: :time_window, in: :body, schema: {
      type: :object,
      properties: {
        beginning: { type: :string },
        ending: { type: :string },
        time_schdule_id: { type: :integer }
      },
      required: ["beginning", "ending", "time_schdule_id"],
    }
response "200", "successful" do
      #let(:time_schedule) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
      let(:time_window) { { beginning: "2022-03-29T00:00:00.000", ending: "2022-03-29T12:34:00.000", time_schedule_id: 1 } }
      run_test!
    end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
 #______________________________________________________________________________________________

  end

  path '/time_windows/one_day_weekly_schedule' do

    <<-DOC
    post('create_one_day_weekly_schedule time_window') do
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


     #______________________________________________________________________________________________
  post "create time windows repeating every selected ith day (Monday,...,Sunday) " do       #Label
    tags "Time Windows"
    consumes "application/json"       #Recibe
    parameter name: :time_window, in: :body, schema: {
      type: :object,
      properties: {
        year1: { type: :integer },
        month1: { type: :integer },
        day1: { type: :integer },
        year2: { type: :integer },
        month2: { type: :integer },
        day2: { type: :integer },
        daily_hours_list: { type: :array },
        time_schdule_id: { type: :integer }
      },
      required: ["year1", "month1", "day1","year2", "month2", "day2", "daily_hours_list", "time_schedule_id"],
    }
response "200", "successful" do
      #let(:time_schedule) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
      let(:time_window){ { year1:2022,month1:4,day1:3,year2:2022,month2:4,day2:6, daily_hours_list: [[[7,0],[1,30]], [[3,0],[6,45]]], time_schedule_id: 1 } }
      run_test!
    end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
 #______________________________________________________________________________________________

  end

  path '/time_windows/everyday_work_day' do

    <<-DOC
    post('create_every_work_day_schdule time_window') do
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


     #______________________________________________________________________________________________
  post "create a set of time windows repeating from monday to friday" do       #Label
    tags "Time Windows"
    consumes "application/json"       #Recibe
    parameter name: :time_window, in: :body, schema: {
      type: :object,
      properties: {
        beginning: { type: :string },
        ending: { type: :string },
        time_schdule_id: { type: :integer }
      },
      required: ["beginning", "ending", "time_schdule_id"],
    }
response "200", "successful" do
      #let(:time_schedule) { { address: "calle 195 45B", latitude_location: 1.2, longitude_location: 78.987, total_space: 6000.0,available_space: 1000.0 } }
      let(:time_window) { { beginning: "2022-03-29T00:00:00.000", ending: "2022-03-29T12:34:00.000", time_schedule_id: 1 } }
      run_test!
    end
#response "422", "invalid request" do
#        let(:distribution_center) { { patient_id: 10 } }
#        run_test!
#      end
  end
 #______________________________________________________________________________________________
  end
end
