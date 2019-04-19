require "json"
require "ibm_watson/visual_recognition_v3"

class ClassifyService
  include IBMWatson
  attr_accessor :user, :opportunity

  def initialize(image, filename, type)
    @image = image
    @filename = filename
    @type = type
  end

  def call
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: ENV['WATSON_API_KEY']
    )

    response = visual_recognition.classify(
      images_file: @image,
      images_filename: @filename,
      images_file_content_type: @type,
      threshold: 0,
      classifier_ids: ["BreastCancerDetection_633095304"]
    )

    classes = response.result['images'][0]['classifiers'][0]['classes']
    res = classes.map { |item| [item['class'], item['score']] }.to_h
    return { cancer: res['0YES'], normal: res['NORM'] }
  end
end
