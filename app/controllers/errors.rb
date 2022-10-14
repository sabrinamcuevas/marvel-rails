module Errors
  def not_found
    render json: {
      status: 404,
      error: :not_found,
    }, status: 404
  end

  def internal_server_error
    render json: {
      status: 500,
      error: :internal_server_error,
    }, status: 500
  end

  def bad_request
    render json: {
      status: 400,
      error: :bad_request,
    }, status: 400
  end
end
