# -*- encoding : utf-8 -*-
require 'test_helper'

class CalicataTest < ActiveSupport::TestCase

  fixtures :all

  setup do
    @atributos = { fecha: Date.today }
  end

  test "debería prohibir guardar calicatas sin fecha" do
    c = Calicata.new
    assert c.invalid?, "no se puede guardar sin la fecha"
  end

  test "debería prohibir fechas del futuro" do
    c = Calicata.new :fecha => Date.today + 2
    assert c.invalid?, "la fecha es del futuro"
  end

  test "debería cargar el paisaje asociado" do
    assert_nothing_raised do
      @atributos[:paisaje_attributes] = { :simbolo => "Ps" }
      assert_difference 'Paisaje.count' do
        Calicata.create(@atributos)
      end
    end
  end

  test "debería cargar la ubicación asociada" do
    assert_nothing_raised do
      @atributos[:ubicacion_attributes] = { :descripcion => "Somewhere over the rainbow" }
      assert_difference 'Ubicacion.count' do
        Calicata.create(@atributos)
      end
    end
  end

  test "debería cargar y crear la serie asociada" do
    assert_nothing_raised do
      assert_difference 'Calicata.series.count' do
        Calicata.create modal: true, simbolo: 'As', nombre: 'Ascasubi',
                        fecha: Date.today
      end
    end
  end

  test "debería cargar el drenaje de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:drenaje_id] = Drenaje.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Drenaje, c.drenaje
    end
  end

  test "debería cargar la posicion de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:posicion_id] = Posicion.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Posicion, c.posicion
    end
  end

  test "debería cargar el anegamiento de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:anegamiento_id] = Anegamiento.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Anegamiento, c.anegamiento
    end
  end

  test "debería cargar el relieve de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:relieve_id] = Relieve.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Relieve, c.relieve
    end
  end

  test "debería cargar la permeabilidad de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:permeabilidad_id] = Permeabilidad.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Permeabilidad, c.permeabilidad
    end
  end

  test "debería cargar la pendiente de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:pendiente_id] = Pendiente.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Pendiente, c.pendiente
    end
  end

  test "debería cargar la pedregosidad de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:pedregosidad_id] = Pedregosidad.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Pedregosidad, c.pedregosidad
    end
  end

  test "debería cargar el escurrimiento de la tabla de lookup" do
    assert_nothing_raised do
      @atributos[:escurrimiento_id] = Escurrimiento.first.id
      c = Calicata.create(@atributos)
      assert_instance_of Escurrimiento, c.escurrimiento
    end
  end

  test "debería requerir el nombre" do
    assert Calicata.new(calicatas(:anonima).attributes).invalid?, "valida sin nombre"
  end

  test "no debería permitir nombres duplicados" do
    Calicata.create(calicatas(:carabela).attributes)
    assert Calicata.new(calicatas(:carabela).attributes).invalid?, "permite nombres duplicados"
  end

end
