class SessionsController < Devise::SessionsController
  skip_before_action :expired?
end