class TimeSchedulesController < ApplicationController
  before_action :set_time_schedule, only: [:show, :update, :destroy]

  <<-DOC
_________________________________________________________________________________________________________________
  ___  ______ _____       _____ _____   ___  ____________ _____ _    ______ 
 / _ \ | ___ \_   _|     /  ___/  __ \ / _ \ |  ___|  ___|  _  | |   |  _  \
/ /_\ \| |_/ / | |       \ `--.| /  \// /_\ \| |_  | |_  | | | | |   | | | |
|  _  ||  __/  | |        `--. \ |    |  _  ||  _| |  _| | | | | |   | | | |
| | | || |    _| |_      /\__/ / \__/\| | | || |   | |   \ \_/ / |___| |/ / 
\_| |_/\_|    \___/      \____/ \____/\_| |_/\_|   \_|    \___/\_____/___/  
                                                                                                                                                 
  DOC

  # GET /time_schedules
  def index
    @time_schedules = TimeSchedule.all

    render json: @time_schedules
  end

  # GET /time_schedules/1
  def show
    render json: @time_schedule
  end

  # POST /time_schedules
  def create
    @time_schedule = TimeSchedule.new(time_schedule_params)

    if @time_schedule.save
      render json: @time_schedule, status: :created, location: @time_schedule
    else
      render json: @time_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_schedules/1
  def update
    if @time_schedule.update(time_schedule_params)
      render json: @time_schedule
    else
      render json: @time_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_schedules/1
  def destroy
    @time_schedule.destroy
  end

  #private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_schedule
      @time_schedule = TimeSchedule.find(params[:id])
    end

    #Only allow a list of trusted parameters through.
    def time_schedule_params
      params.require(:time_schedule).permit(:title, :description, :distribution_center_id)
    end




end
