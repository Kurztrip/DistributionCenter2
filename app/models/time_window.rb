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
end
