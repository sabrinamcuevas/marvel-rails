class Success
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def success?
    true
  end
end