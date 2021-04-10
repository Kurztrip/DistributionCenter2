class TimeWindowsController < ApplicationController
  require 'date'
  before_action :set_time_window, only: [:show, :update, :destroy]


  <<-DOC
_________________________________________________________________________________________________________________
  ___  ______ _____       _____ _____   ___  ____________ _____ _    ______ 
 / _ \ | ___ \_   _|     /  ___/  __ \ / _ \ |  ___|  ___|  _  | |   |  _  \
/ /_\ \| |_/ / | |       \ `--.| /  \// /_\ \| |_  | |_  | | | | |   | | | |
|  _  ||  __/  | |        `--. \ |    |  _  ||  _| |  _| | | | | |   | | | |
| | | || |    _| |_      /\__/ / \__/\| | | || |   | |   \ \_/ / |___| |/ / 
\_| |_/\_|    \___/      \____/ \____/\_| |_/\_|   \_|    \___/\_____/___/  
                                                                                                                                                 
  DOC



  # GET /time_windows
  def index
    @time_windows = TimeWindow.all

    render json: @time_windows
  end

  # GET /time_windows/1
  def show
    render json: @time_window
  end

  # POST /time_windows
  def create
    @time_window = TimeWindow.new(time_window_params)
    #puts(time_window_params)
    #____________________________________________________
    #Verificar que no se presente superposicion
    time_windows = TimeWindow.all
    beginning_datetime = @time_window.beginning
    ending_datetime = @time_window.ending

    if(beginning_datetime>ending_datetime)
      render json: "La fecha inicial debe ser antes de la fecha final", status: :bad_request
      return
    end

    no_superposition = true
    for ith_window in time_windows do
      if !( (beginning_datetime >= ith_window.ending) || (ending_datetime <= ith_window.beginning) )
        no_superposition = false
      end
    end

    if(no_superposition==false)
      render json: "La ventana temporal ingresada se cruza con una ventana existente. Realize las correcciones o eliminaciones pertinentes e intente de nuevo", status: :bad_request
      return
    end
    #____________________________________________________
    if @time_window.save
      render json: @time_window, status: :created, location: @time_window
    else
      render json: @time_window.errors, status: :unprocessable_entity
    end
  end




  # PATCH/PUT /time_windows/1
  def update
    if @time_window.update(time_window_params)
      render json: @time_window
    else
      render json: @time_window.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_windows/1
  def destroy
    @time_window.destroy
  end

  #private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_window
      @time_window = TimeWindow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_window_params
      params.require(:time_window).permit(:beginning, :ending, :time_schedule_id)
    end



    <<-DOC
______________________________________________________________________________________________________________
___  ___     _            _                                            _            
|  \/  |    | |          | |                                          | |           
| .  . | ___| |_ ___   __| | ___  ___        __ _  __ _  ___ _ __   __| | __ _ _ __ 
| |\/| |/ _ \ __/ _ \ / _` |/ _ \/ __|      / _` |/ _` |/ _ \ '_ \ / _` |/ _` | '__|
| |  | |  __/ || (_) | (_| | (_) \__ \     | (_| | (_| |  __/ | | | (_| | (_| | |   
\_|  |_/\___|\__\___/ \__,_|\___/|___/      \__,_|\__, |\___|_| |_|\__,_|\__,_|_|   
                                                   __/ |                            
                                                  |___/                             
 _                          _                                                       
| |                        (_)                                                      
| |__   ___  _ __ __ _ _ __ _  ___  ___                                             
| '_ \ / _ \| '__/ _` | '__| |/ _ \/ __|                                            
| | | | (_) | | | (_| | |  | | (_) \__ \                                            
|_| |_|\___/|_|  \__,_|_|  |_|\___/|___/                                            
                                                
    DOC


    require 'date'


    #_____________________________________________________________________________________________________

    #METODO PARA ESTABLECER UNAS FRANJAS HORARIAS IGUALES TODOS LOS DIAS
      #(year1,month1,day1,year2,month2,day2,daily_hours_list)
      #daily_hours_list es una lista con pares inicio-fin de hora-minuto 

    #EJEMPLO: create_everyday_schdule(2021,4,3,2021,4,6,[ [[7,0],[12,30]], [[16,0],[18,45]]])

    def create_everyday_schdule
      
        daily_hours_list = params[:daily_hours_list]
        start_day = DateTime.new(params[:year1],params[:month1],params[:day1])
        
        end_day = DateTime.new(params[:year2],params[:month2],params[:day2])
        
        day_iterator_loop = start_day
        day_iterator = start_day
        
        
        while (day_iterator_loop <= end_day) do
            
          
            for i in  daily_hours_list do
                #puts("-------------------------------")
                start_hour_and_minute = i[0]
                start_hour = start_hour_and_minute[0]
                start_minute = start_hour_and_minute[1]

                day_iterator =  DateTime.new(day_iterator_loop.year,day_iterator_loop.month,day_iterator_loop.day,start_hour,start_minute)
                start_time_window = day_iterator
                

                end_hour_and_minute = i[1]
                end_hour = end_hour_and_minute[0]
                end_minute = end_hour_and_minute[1]

                day_iterator =  DateTime.new(day_iterator_loop.year,day_iterator_loop.month,day_iterator_loop.day,end_hour,end_minute)
                end_time_window = day_iterator

                new_time_window = TimeWindow.new
                new_time_window.beginning = start_time_window
                new_time_window.ending = end_time_window
                new_time_window.time_schedule = TimeSchedule.find(params[:time_schedule_id])
                new_time_window.save

                
                #puts("-------------------------------")  
            end 

        
        day_iterator_loop += 1  
        end
        render status: :ok
    end
    #_____________________________________________________________________________________________________







    #_____________________________________________________________________________________________________-

    #METODO PARA ESTABLECER UNAS FRANJAS HORARIAS IGUALES TODOS LOS DIAS EXCEPTO SABADO Y DOMINGO

      #(year1,month1,day1,year2,month2,day2,daily_hours_list)
      #daily_hours_list es una lista con pares inicio-fin de hora-minuto 
      #EJEMPLO: create_everyday_schdule(2021,4,3,2021,4,6,[ [[7,0],[12,30]], [[16,0],[18,45]]])


    def create_every_work_day_schdule
      
        daily_hours_list = params[:daily_hours_list]
        start_day = DateTime.new(params[:year1],params[:month1],params[:day1])
        
        end_day = DateTime.new(params[:year2],params[:month2],params[:day2])
        
        day_iterator_loop = start_day
        day_iterator = start_day
        

        while (day_iterator_loop <= end_day) do
            
          
            for i in  daily_hours_list do
              if( (day_iterator_loop.strftime("%A") != "Saturday") && (day_iterator_loop.strftime("%A") != "Sunday") ) then
                #puts("-------------------------------")
                start_hour_and_minute = i[0]
                start_hour = start_hour_and_minute[0]
                start_minute = start_hour_and_minute[1]

                day_iterator =  DateTime.new(day_iterator_loop.year,day_iterator_loop.month,day_iterator_loop.day,start_hour,start_minute)
                start_time_window = day_iterator
                

                end_hour_and_minute = i[1]
                end_hour = end_hour_and_minute[0]
                end_minute = end_hour_and_minute[1]

                day_iterator =  DateTime.new(day_iterator_loop.year,day_iterator_loop.month,day_iterator_loop.day,end_hour,end_minute)
                end_time_window = day_iterator

                new_time_window = TimeWindow.new
                new_time_window.beginning = start_time_window
                new_time_window.ending = end_time_window
                new_time_window.time_schedule = TimeSchedule.find(params[:time_schedule_id])
                new_time_window.save

                
                #puts("-------------------------------")  
              end
            end 

        
        day_iterator_loop += 1  
        end
        render status: :ok
    end
    #_____________________________________________________________________________________________________-







    #_____________________________________________________________________________________________________-

    #METODO PARA ESTABLECER UNAS FRANJAS HORARIAS SEGUN INTERVALOS DE TIEMPO QUE SE REPITEN UN DIA DEFINIDO SEMANALMENE
    #POR EJEMPLO QUE TODOS LOS VIERNES ENTRE UNA FECHA 1 Y UNA FECHA 2 SE LES ASIGNE UN MISMO HORARIO

      #(year1,month1,day1,year2,month2,day2,daily_hours_list,weekday)
      #daily_hours_list es una lista con pares inicio-fin de hora-minuto 
      #EJEMPLO: create_everyday_schdule(2021,4,3,2021,4,6,[ [[7,0],[12,30]], [[16,0],[18,45]]])


    def create_one_day_weekly_schedule
      
        daily_hours_list = params[:daily_hours_list]
        start_day = DateTime.new(params[:year1],params[:month1],params[:day1])
        
        end_day = DateTime.new(params[:year2],params[:month2],params[:day2])
        
        day_iterator_loop = start_day
        day_iterator = start_day
        week_day = params[:week_day]

        
        #Hallar primer dia LMXJVSD SEGUN PARAMETRO ENVIADO
        while (day_iterator_loop.strftime("%A") != week_day) do
              day_iterator_loop += 1
        end

        
        
        while (day_iterator_loop <= end_day) do
            
          
            for i in  daily_hours_list do
                #puts("-------------------------------")
                start_hour_and_minute = i[0]
                start_hour = start_hour_and_minute[0]
                start_minute = start_hour_and_minute[1]

                day_iterator =  DateTime.new(day_iterator_loop.year,day_iterator_loop.month,day_iterator_loop.day,start_hour,start_minute)
                start_time_window = day_iterator
                

                end_hour_and_minute = i[1]
                end_hour = end_hour_and_minute[0]
                end_minute = end_hour_and_minute[1]

                day_iterator =  DateTime.new(day_iterator_loop.year,day_iterator_loop.month,day_iterator_loop.day,end_hour,end_minute)
                end_time_window = day_iterator

                new_time_window = TimeWindow.new
                new_time_window.beginning = start_time_window
                new_time_window.ending = end_time_window
                new_time_window.time_schedule = TimeSchedule.find(params[:time_schedule_id])
                new_time_window.save

                
                #puts("-------------------------------")  
            end 

        
        day_iterator_loop += 7  
        end
        #render json: 
        render status: :ok
    end
    #_____________________________________________________________________________________________________-




end
