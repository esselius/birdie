class Provisioner
  def initialize(client)
    @client = client
  end

  def create(vpcs)
    vpcs.fetch(:vpcs).each do |vpc|
      resp = @client.create_vpc(
        cidr_block: vpc.fetch('cidr')
      )

      vpc_id = resp.vpc.vpc_id

      @client.create_tags(
        resources: [vpc_id],
        tags: [
          {
            key: 'Name',
            value: vpc.fetch('name')
          }
        ]
      )
      self
    end
  end
end
