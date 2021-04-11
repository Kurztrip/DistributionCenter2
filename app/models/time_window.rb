class TimeWindow < ApplicationRecord
  belongs_to :time_schedule
  #def initialize(beginning, ending,time_schedule)
   # @beginning = beginning
   # @ending = ending
   # @time_schedule = time_schedule
  #end


   #____________________________________________________
    #Verificar que no se presente superposicion

    def self.new_window_has_conflict(beginning_datetime, ending_datetime)
      time_windows = TimeWindow.all

      if(beginning_datetime>ending_datetime)
        return "La fecha inicial debe ser antes de la fecha final"
      end

      no_superposition = true
      for ith_window in time_windows do
        if !( (beginning_datetime >= ith_window.ending) || (ending_datetime <= ith_window.beginning) )
          no_superposition = false
        end
      end

      if(no_superposition==false)
        return "La ventana temporal ingresada se cruza con una ventana existente. Realize las correcciones o eliminaciones pertinentes e intente de nuevo"
      end

      return "ok"

    end
    #____________________________________________________


    def self.not_any_windows_has_conflict(day_iterator_loop, end_day, daily_hours_list, step)
      #
      while (day_iterator_loop <= end_day) do
            
          
        for i in  daily_hours_list do
            
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

            any_conflict = TimeWindow.new_window_has_conflict(start_time_window, end_time_window)
            
            if (any_conflict != "ok")
              return "No fue posible crear el horario. Error: " + any_conflict + "[ "+ start_time_window.strftime() + "," + end_time_window.strftime() + " ]"
            end
           
        end 

      day_iterator_loop += step  
      end
      #
      return "ok"
    end
end
