module Errors
  def bad_request
    render json: {
      status: 400,
      error: :bad_request,
      message: '400 Bad Request'
    }, status: 400
  end

  def not_found
    render json: {
      status: 404,
      error: :not_found,
      message: '404 Not Found'
    }, status: 404
  end

  def internal_server_error
    render json: {
      status: 500,
      error: :internal_server_error,
      message: '500 Internal Server Error'
    }, status: 500
  end

end
