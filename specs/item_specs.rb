require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/manufacturer')
require_relative('../models/stock')





class ItemTest < MiniTest::Test

  def setup
    @item1=Stock.new({'name'=>'Playstation 4','manufacturer_id'=>6,'type'=>'console',
      'quantity'=>10,'unit_cost'=>300,'sell_cost'=>350.70,
      'url'=>'WEB ADDRESS GOES HERE'})
    @item2=Stock.new({'name'=>'Ipad 6','manufacturer_id'=>4,'type'=>'tablet',
        'quantity'=>15,'unit_cost'=>450,'sell_price'=>500.70})
  end

  def test_for_stock_name #test passed- returns name
    assert_equal('Playstation 4',@item1.name)
  end

  def test_for_stock_manu_id #test passed- returns name
    assert_equal(4,@item2.manufacturer_id)
  end

  def test_for_stock_type #test passed- returns item type
    assert_equal('console',@item1.type)
  end

  def test_for_stock_quantity #test passed- returns quantity
    assert_equal(15,@item2.quantity)
  end

  def test_for_unit_cost # test passed- returns unit cost
    assert_equal(300,@item1.unit_cost)
  end

  def test_for_sell_cost #test passed- returns sell
    assert_equal(350.70,@item1.sell_price)
  end

  def test_for_description #test passed-returns description
    assert_equal('DESCRIPTION TO GO HERE-PLEASE UPDATE',@item2.description)
  end

  def test_for_url #test passed- returns url (placeholder text)
    assert_equal('URL TO GO HERE- SOURCE AND UPDATE',@item1.url)
  end

  def test_update_description #test passed- description updated
    @item1.description="Latest Playstation"
    assert_equal('Latest Playstation',@item1.description)
  end

  def test_update_url #test passed- url updated
    @item2.url="www.apple.com"
    assert_equal('www.apple.com',@item2.url)
  end

  #all properties accessible






















end
