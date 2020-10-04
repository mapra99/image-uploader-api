class ImagesController < ApplicationController
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
      render json: {url: url_for(image.image), created_at: image.created_at}
    else
      render json: { error: 'Bad Request' }, status: 400
    end
  end
end
