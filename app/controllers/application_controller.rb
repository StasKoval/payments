class ApplicationController < ActionController::Base
  include SessionsHelper


  before_filter :signed_in_user, :except=>[:new, :create]
  protect_from_forgery
end
