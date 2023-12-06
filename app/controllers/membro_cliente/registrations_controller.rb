class MembroCliente::RegistrationsController < Devise::RegistrationsController
  layout 'membro_cliente'

  before_action :defaults

  def defaults
  end

  private
  def account_update_params
    params.require(:membro_cliente).permit(:nome, :email, :telefone, :password, :password_confirmation, :current_password)
  end
end
