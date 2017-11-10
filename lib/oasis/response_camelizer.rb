module Oasis
  class ResponseCamelizer
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if is_json_content?(env)
        response = [snake_to_camel(response.body)]
      end

      [status, headers, response]
    end

    def snake_to_camel(response_body)
      body = ActiveSupport::JSON.decode(response_body)
      body.deep_transform_keys { |key| key.camelize(:lower) }.to_json
    end
  end
end
