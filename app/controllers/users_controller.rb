class UsersController < ApplicationController

	def edit
	end

	def update
    http = Net::HTTP.new(ENV['BACKEND_URL'], ENV['BACKEND_PORT'])
    response = http.send_request('PUT', "/test-organization/newapp/user/#{current_user_id}?access_token=#{ENV['BACKEND_ACCESS_TOKEN']}", format_params.to_json)
    @user = JSON.parse(response.body)['entities'].first
	end

  private

  def format_params
    {
      adr: {
        addr1: params[:home][:addr1],
        addr2: params[:home][:addr2],
        city: params[:home][:city],
        state: params[:home][:state],
        zip: params[:home][:zip],
        country: params[:home][:country],
      },
      work_adr: {
        addr1: params[:work][:addr1],
        addr2: params[:work][:addr2],
        city: params[:work][:city],
        state: params[:work][:state],
        zip: params[:work][:zip],
        country: params[:work][:country],
      }
    }
  end
end
