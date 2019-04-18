class DetectionsController < ApplicationController
  before_action :set_detection, only: [:show, :edit, :update, :destroy, :check]

  # GET /detections
  def index
    @detections = Detection.all
  end

  # GET /detections/1
  def show
  end

  # GET /detections/new
  def new
    @detection = Detection.new
  end

  # GET /detections/1/edit
  def edit
  end

  # POST /detections
  def create
    @detection = Detection.new()
    @detection.image.attach(detection_params[:image])

    if @detection.save
      redirect_to @detection, notice: 'Detection was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /detections/1
  def update
    if @detection.update(detection_params)
      redirect_to @detection, notice: 'Detection was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /detections/1
  def destroy
    @detection.destroy
    redirect_to detections_url, notice: 'Detection was successfully destroyed.'
  end

  def check
    url = @detection.image.service_url.split("?").first
    response = ClassifyService.new(url).call
    @detection.update(response)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_detection
    @detection = Detection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def detection_params
    # params.fetch(:detection)
    params.require(:detection).permit(:image)
  end
end
