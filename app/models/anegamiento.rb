# Mantiene los valores posibles para Anegamiento en la ficha de perfiles.
class Anegamiento < ActiveRecord::Base
  include Mostrable

  has_many :perfiles

  # Globalize recomienda sacar las columnas originales, pero validamos los setters
  validates :valor, presence: true, uniqueness: true

  active_admin_translates :valor, touch: true
end
