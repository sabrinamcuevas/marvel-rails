class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :bad_request

  include Pagy::Backend
  include Errors
end
