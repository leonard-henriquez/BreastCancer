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
      classifier_ids: [ENV['CLASSIFIER'], "default"]
    )

    classifier = response.result['images'][0]['classifiers']

    default = (classifier[0]['classifier_id'] == 'default') ? 0 : 1
    custom = (classifier[0]['classifier_id'] == 'default') ? 1 : 0

    mammogram_class = classifier[default]['classes'].find do |item|
      item['class'] == 'mammogram (x-ray)'
    end

    is_mammogram = mammogram_class['score'] unless (mammogram_class.nil?)
    is_mammogram = is_mammogram || 0

    classes = classifier[custom]['classes']
    res = classes.map { |item| [item['class'], item['score']] }.to_h

    return {
      cancer: res['0YES'],
      normal: res['NORM'],
      is_mammogram: is_mammogram
    }
  end
end
