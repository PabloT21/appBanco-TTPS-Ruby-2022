# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  rol                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sucursal_id            :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_sucursal_id           (sucursal_id)
#
# Foreign Keys
#
#  fk_rails_...  (sucursal_id => sucursals.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :sucursal, :class_name => 'Sucursal', optional: true, default: nil

  has_many :creados, :class_name => "Turn", :foreign_key => "creador_id"
  has_many :atendidos, :class_name => "Turn", :foreign_key => "empleado_id"

  before_create :set_default_rol, :if => :new_record?
  def set_default_rol
    self.rol ||= "usuario"
  end
  #Role methods
  def admin?
    rol=="admin"
  end

  def empleado?
    rol=="empleado"
  end

  def cliente?
    rol=="usuario"
  end
end