class ApplicationController < ActionController::Base
  layout -> { "application" if turbo_frame_request? }
end
