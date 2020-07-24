class Public::ApplicationController < ApplicationController
  layout 'public/application'
  before_action :authenticate_user!
end