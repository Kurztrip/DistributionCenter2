Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  match '/time_schedules/time_schedule_windows/:id' => 'time_schedules#get_time_schedule_windows', :via => :get
  resources :time_windows
  resources :time_schedules
  resources :distribution_centers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/time_windows/everyday', to: 'time_windows#create_everyday_schedule'
  post '/time_windows/one_day_weekly_schedule', to: 'time_windows#create_one_day_weekly_schedule'
  post '/time_windows/everyday_work_day', to: 'time_windows#create_every_work_day_schedule'
  #get '/time_windows/time_schedule_windows', to: 'time_windows#get_time_schedule_windows'
  


end


