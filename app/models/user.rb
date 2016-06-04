class User
  def self.from_omniauth(auth)
    # put the data to the backend
    #http = Net::HTTP.new(ENV['BACKEND_URL'], ENV['BACKEND_PORT'])
    #response = http.send_request('PUT', "ROOT/test-organization/newapp/user/#{auth['uid']}", self.to_backend_format(auth))
    auth
  end

  def self.to_backend_format(auth)
    {
      username: auth['uid'],
      name: auth['extra']['raw_info']['name'],
      title: "",
      url: "",
      email: auth['info']['email'],
      tel: "",
      picture: auth['info']['image'],
      birthday: "",
      adr: {
      }
    }
  end
end
