Rails.application.routes.draw do
  resources :time_windows
  resources :time_schedules
  resources :distribution_centers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/time_windows/everyday', to: 'time_windows#create_everyday_schdule'
  post '/time_windows/one_day_weekly_schedule', to: 'time_windows#create_one_day_weekly_schedule'
  post '/time_windows/everyday_work_day', to: 'time_windows#create_every_work_day_schdule'



end
