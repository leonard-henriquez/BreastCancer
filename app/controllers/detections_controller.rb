class DetectionsController < ApplicationController
  before_action :set_detection, only: [:show, :check]

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

  # POST /detections
  def create
    @detection = Detection.new()
    img = detection_params[:image]

    call_watson(img)

    @detection.image.attach(img)
    if @detection.save
      redirect_to @detection, notice: 'Detection was successfully created.'
    else
      render :new
    end
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

  def call_watson(img)
    filename = img.original_filename
    type = img.content_type

    temp_path = Rails.root.join('tmp', filename)
    File.open(temp_path, 'wb') { |file| file.write(img.tempfile.read) }

    file_stream = File.open(temp_path)
    File.delete(temp_path) if File.exist?(temp_path)

    response = ClassifyService.new(file_stream, filename, type).call

    @detection.update(response)
  end
end
