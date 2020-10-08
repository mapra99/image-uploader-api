class HealthController < ApplicationController
  include CORSPolicy

  before_action do
    allow_cross_origins everything: true
  end

  def index
    render json: { status: 'OK' }, status: :ok
  end
end
