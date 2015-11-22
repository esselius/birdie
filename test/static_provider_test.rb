require_relative 'test_helper'

class StaticProviderTest < Minitest::Test
  def test_can_register_vpc
    vpc = {
      'type' => 'vpc',
      'name' => 'test',
      'cidr' => '10.0.0.0/16'
    }

    provider = StaticProvider.new
    provider.register(vpc)

    assert_equal({ vpcs: [vpc] }, provider.vpcs)
  end

  def test_has_priority_of_100
    provider = StaticProvider.new

    assert_equal 100, provider.priority
  end
end
