require_relative '../guide_exception.rb'

class GuideExceptions::InvalidRomanNumber < GuideException
  def friendly_message
    "Input roman number sequence is invalid"
  end
end
