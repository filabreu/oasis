module Oasis
  class RequestSnakelizer
    def initialize(app)
      @app = app
    end

    def call(env)
      if is_json_content?(env) && is_submit_request?(env)
        env["action_dispatch.request.request_parameters"] = camel_to_snake(env["action_dispatch.request.request_parameters"])
      end

      status, headers, response = @app.call(env)

      [status, headers, [snake_to_camel(response.body)]]
    end

    def camel_to_snake(request_params)
      request_params.deep_transform_keys { |key| key.to_s.underscore }
    end
  end
end
