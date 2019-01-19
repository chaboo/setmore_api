module SetmoreApi
  class Connection
    
    SETMORE_URI= 'https://developer.setmore.com/api/v1'

    def initialize
      fail 'SetmoreApi not configured yet!' unless SetmoreApi.configuration&&SetmoreApi.configuration.refreash_token
    end

    def get(params)
      uri = URI.parse(SETMORE_URI+params.delete(:request_path))
      uri.query = URI.encode_www_form(params)
      @req = Net::HTTP::Get.new(uri.to_s)
      set_headers params.delete(:headers) if params.key?(:headers)
      response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
        http.request(@req)
      }
      JSON.parse(response.body)
    end

    def set_headers headers
      Hash[ headers.map { |key, value| @req[key] = value } ]
    end

  end
end