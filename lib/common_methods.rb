module CommonMethods
  def invite_user_to_onfleet(_user)
    # $auth = 'Basic ' + 'ZGQ0YTI3NjlmODE4ZTU3ZjRmZDdhZjg1OGYwNDVjYTI6'
    # # => "Basic ZGQ0YTI3NjlmODE4ZTU3ZjRmZDdhZjg1OGYwNDVjYTI6"
    # # $url = 'https://onfleet.com/api/v2/auth/test'
    # $url = 'https://onfleet.com/api/v2/workers'
    # # => "https://onfleet.com/api/v2/auth/test"
    # @resource = RestClient::Resource.new($url)
    # # => #<RestClient::Resource:0x007fe824d44860 @url="https://onfleet.com/api/v2/auth/test", @block=nil, @options={}>
    # @response = @resource.get(Authorization: $auth)
    # # => <RestClient::Response 200 "{\"message\":...">
    #
    # json_str = '{"name":"TEST A Swartz","phone":"424-283-1077","teams":[""],"vehicle":{"type":"CAR","description":"Tesla Model 3","licensePlate":"FKNS9A","color":"purple"}}'
    # @response_2 = @resource.post(json_str, content_type: :json, accept: :json, Authorization: $auth)
    #
    # @request = RestClient::Request.new(
    #   method: :post,
    #   url: $url,
    #   Authorization: @auth,
    #   payload: {
    #     name: 'TEST A Swartz',
    #     phone: '424-283-1077',
    #     teams: ['XwBi3JUUWvvVcoYxK861XRCg'],
    #     vehicle: { type: 'CAR', description: 'Tesla Model 3', licensePlate: 'FKNS9A', color: 'purple' }
    #   }
    # )
    # @response_2 = @request.execute

    Onfleet.api_key = 'dd4a2769f818e57f4fd7af858f045ca2'
    worker = Onfleet::Worker.create(name: 'Avan Sardar', email: 'avansardar@outlook.com', teams: ['XwBi3JUUWvvVcoYxK861XRCg'], vehicle: { type: 'CAR' }, phone: '424-283-1077')
  end
end
