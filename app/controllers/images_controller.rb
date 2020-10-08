class ImagesController < ApplicationController
  include CORSPolicy

  before_action do
    allow_cross_origins local_port: 3000
  end

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: 404
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def create
    image = Image.new
    if params[:image].present?
      image.image.attach(params[:image])
      image.save
      render json: { url: url_for(image.image), created_at: image.created_at }, status: :ok
    else
      render json: { error: 'Bad Request' }, status: 400
    end
  end

  def index
    images = Image.all
    payload = images.map do |img|
      { url: url_for(img.image), created_at: img.created_at }
    rescue StandardError
      { url: '', created_at: img.created_at }
    end

    render json: payload, status: :ok
  end
end
