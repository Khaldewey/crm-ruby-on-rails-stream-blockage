#encoding: utf-8

models = {
  'Program' => 'Programas',
  'Role' => 'Grupo',
  'User' => 'Usuário',
  'Customer' => 'Cliente',
  'MembroCliente' => 'Membros do cliente',
  'Blockage' => 'Bloqueios de transmissão',
  'UrlStream' => 'Link de transmissão'
}

actions = { 'create' => 'adicionar', 'read' => 'visualizar', 'update' => 'editar', 'destroy' => 'remover' }


models.each do |object|
  actions.each do |action|
    Permission.find_or_create_by(object_type: object[0], action_name: action[0]) do |r|
      r.description = "#{action[1].camelize} #{object[1]}"
    end
  end
end

%w(Admin Redação Cliente Atendimento).each do |role|
  Role.find_or_create_by(name: role)
end

User.find_or_create_by(email: 'redacao@corp.agenciaacerte.com') do |u|
  u.password = '#acer7e2727'
  u.is_active = true
  u.role = Role.where(name: 'Redação').first
end

User.find_or_create_by(email: 'atendimento@agenciaacerte.com') do |u|
  u.password = 'Atend2727*'
  u.is_active = true
  u.role = Role.where(name: 'Atendimento').first
end

namespace :dev do
  User.find_or_create_by(email: 'desenvolvimento@agenciaacerte.com') do |u|
    u.password = '-, 8?Wgc-_j<np#~'
    u.is_active = true
    u.role = Role.where(name: 'Admin').first
    u.is_admin = true
  end
end
