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

    Onfleet.api_key = ENV['ONFLEET_API_KEY']
    team_id = getTeamID(_user)
    worker = Onfleet::Worker.create(name: _user.first_name, email: _user.email, teams: [team_id], vehicle: { type: 'CAR' }, phone: _user.phone_number)
  end

  # TODO: hardcoded
  def getTeamID(_user)
    # Figure out zip code and return the correct team using the zip code
    'XwBi3JUUWvvVcoYxK861XRCg'
  end
end
