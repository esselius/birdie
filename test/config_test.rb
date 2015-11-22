require_relative 'test_helper'

class ConfigTest < Minitest::Test
  def test_can_register_provider
    config = Config.new
    provider = OpenStruct.new(priority: 0)

    config.register(provider)

    assert_includes config.providers, provider
  end

  def test_can_get_config_from_providers
    provider1 = OpenStruct.new( hello: { world: 123 } )
    provider2 = OpenStruct.new( hello: { sup: 321 } )

    config = Config.new
    config.register(provider1)
    config.register(provider2)

    assert_equal({ world: 123, sup: 321 }, config.get(:hello))
  end

  def test_merges_provider_data_based_on_priority
    provider1 = OpenStruct.new( hello: { world: 123 }, priority: 1 )
    provider2 = OpenStruct.new( hello: { world: 321 }, priority: 100 )
    provider3 = OpenStruct.new( hello: { world: 894 }, priority: 1000 )

    config = Config.new
    config.register(provider1)
    config.register(provider2)
    config.register(provider3)

    assert_equal({ world: 123 }, config.get(:hello))

    config = Config.new
    config.register(provider3)
    config.register(provider1)
    config.register(provider2)

    assert_equal({ world: 123 }, config.get(:hello))
  end
end
