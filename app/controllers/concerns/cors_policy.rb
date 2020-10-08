# frozen_string_literal: true

module CORSPolicy
  ALLOWED_DOMAIN = ''

  def allow_cross_origins(everything: false, local_port: nil)
    if everything
      response.headers['Access-Control-Allow-Origin'] = '*'
    elsif local_port.present?
      response.headers['Access-Control-Allow-Origin'] = "http://localhost:#{local_port}"
    else
      response.headers['Access-Control-Allow-Origin'] = ALLOWED_DOMAIN
    end
  end
end
