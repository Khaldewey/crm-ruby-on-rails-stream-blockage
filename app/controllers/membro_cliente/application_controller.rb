class MembroCliente::ApplicationController < ApplicationController#ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_action :defaults, :authenticate_membro_cliente!

  layout 'membro_cliente'

  WillPaginate.per_page = 10

  def defaults
   
  end

end
