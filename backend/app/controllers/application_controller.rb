# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_filter :verify_authenticity_token
end
