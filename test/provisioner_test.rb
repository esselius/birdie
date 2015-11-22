require_relative 'test_helper'

class ProvisionerTest < Minitest::Test
  def test_can_create_vpc
    provisioner = Provisioner.new(Aws::EC2::Client.new(stub_responses: true))

    vpcs = {
      vpcs: [
        {
          'name' => 'test',
          'cidr' => '10.0.0.0/16'
        }
      ]
    }

    assert provisioner.create(vpcs)
  end
end
