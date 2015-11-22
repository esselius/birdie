class StaticProvider
  def initialize
    @store = Hash.new { |h,k| h[k]=[] }
  end

  def register(data)
    @store[data.fetch('type')] << data
    self
  end

  def vpcs
    {
      vpcs: @store['vpc']
    }
  end

  def subnets
    {
      subnets: @store['subnet']
    }
  end

  def priority
    100
  end
end
