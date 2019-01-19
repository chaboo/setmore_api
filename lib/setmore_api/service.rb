module SetmoreApi
  class Service
    
    REQUEST_PATH = '/bookingapi/services'

    def initialize
      fail 'SetmoreApi not configured yet!' unless SetmoreApi.configuration&&SetmoreApi.configuration.refreash_token
    end

    def get_services
      byebug
      params = {:request_path => REQUEST_PATH, :refreshToken =>  SetmoreApi.configuration.refreash_token}
      SetmoreApi.get(params)
    end

  end
end