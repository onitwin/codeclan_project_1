require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/manufacturer')
require_relative('../models/stock')





class ManufacturerTest < MiniTest::Test

  def setup
    @manu1=Manufacturer.new({'name'=>'Sony'})
    @manu2=Manufacturer.new({'name'=>'HP'})
    @manu3=Manufacturer.new({'name'=>'Samsung'})
    @manu4=Manufacturer.new({'name'=>'Amstrad'})

    stock1=Stock.new({'name'=>'Playstation 4','manufacturer_id'=>6,'type'=>'Games Console','quantity'=>10,'unit_cost'=>300,'sell_cost'=>350})
  end

  def test_for_manu_name #test passed- name accessible
    assert_equal('Sony',@manu1.name)
  end

  def test_for_manu_boolean# test passed- boolean accessible
    assert_equal(true,@manu2.active)
  end

  def test_to_write_name #test passed-name can be re-written
    @manu1.name='Commodore'
    assert_equal('Commodore',@manu1.name)
  end

  def test_update_boolean
    @manu1.active=false
    assert_equal(false,@manu1.active)
  end






















end
