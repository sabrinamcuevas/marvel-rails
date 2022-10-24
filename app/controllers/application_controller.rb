class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :bad_request
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  include Pagy::Backend
  include Errors
end
