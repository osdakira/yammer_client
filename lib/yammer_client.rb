require "yammer_client/version"
require "faraday"

class Yammer
  BASE_URI = 'https://www.yammer.com'

  def initialize(oauth_token: nil, group_id: nil, replied_to_id: nil)
    fail unless oauth_token
    @oauth_token = oauth_token
    @group_id = group_id
    @replied_to_id = replied_to_id
    @conn = ::Faraday::Connection.new(url: BASE_URI) do |builder|
      builder.use ::Faraday::Request::UrlEncoded
      builder.use ::Faraday::Response::Logger
      builder.use ::Faraday::Adapter::NetHttp
    end
  end

  def notify(message, group_id: nil, replied_to_id: nil)
    @group_id = group_id if group_id
    @replied_to_id = replied_to_id if replied_to_id
    @conn.post do | request |
      request.url "/api/v1/messages.json"
      request.headers = { "Authorization" => "Bearer #{@oauth_token}" }
      request.params[:body] = message
      request.params[:group_id] = @group_id if @group_id
      request.params[:replied_to_id] = @replied_to_id if @replied_to_id
    end
  end
end
