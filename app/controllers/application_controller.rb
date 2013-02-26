class ApplicationController < ActionController::Base
  include SessionsHelper

  before_filter :signed_in_user
  protect_from_forgery
end
