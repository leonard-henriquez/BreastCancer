require "json"
require "ibm_watson/visual_recognition_v3"

class ClassifyService
  include IBMWatson
  attr_accessor :user, :opportunity

  def initialize(url = nil)
    @url = url || "https://watson-developer-cloud.github.io/doc-tutorial-downloads/visual-recognition/640px-IBM_VGA_90X8941_on_PS55.jpg"
  end

  def call
    visual_recognition = VisualRecognitionV3.new(
      version: "2018-03-19",
      iam_apikey: ENV['WATSON_API_KEY']
    )

    classes = visual_recognition.classify(@url)
    puts JSON.pretty_generate(classes.result)
  end
end
