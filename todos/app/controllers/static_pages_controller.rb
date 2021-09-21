class StaticPagesController < ApplicationController
  before_action :redirect_if_logged_in
  
  def root
  end
end
