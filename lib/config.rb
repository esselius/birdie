class Config
  attr_reader :providers

  def initialize
    @providers = []
  end

  def register(provider)
    @providers << provider
    sort
    self
  end

  def get(type)
    providers.map do |provider|
      provider.send(type)
    end.reduce({}, :merge)
  end

  private

  def sort
    providers.sort_by! { |provider| provider.priority }.reverse!
  end
end
