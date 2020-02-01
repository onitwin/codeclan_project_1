require_relative('../models/manufacturer')
require_relative('../models/stock')
require("pry-byebug")

#sample manufacturers for table

sony=Manufacturer.new('name'=>'Sony')
apple=Manufacturer.new('name'=>'Apple')
samsung=Manufacturer.new('name'=>'Samsung')
huawei=Manufacturer.new('name'=>'Huwaei')
microsoft=Manufacturer.new('name'=>'Microsoft')

#save manufacturers
sony.save()
apple.save()
samsung.save()
huawei.save()
microsoft.save()

#sample stock items
playstation=Stock.new({'name'=>'Playstation 4','manufacturer_id'=>sony.id,'type'=>'Console','bsl'=>15,'quantity'=>10,'unit_cost'=>300.60,'sell_price'=>400.55})
xbox=Stock.new({'name'=>'Xbox One','manufacturer_id'=>microsoft.id,'type'=>'Console','bsl'=>10,'quantity'=>3,'unit_cost'=>250.50,'sell_price'=>449.99})
ipad=Stock.new({'name'=>'Ipad Air','manufacturer_id'=>apple.id,'type'=>'Tablet','bsl'=>3,'quantity'=>3,'unit_cost'=>300,'sell_price'=>600})
p30=Stock.new({'name'=>'P30 Pro','manufacturer_id'=>huawei.id,'type'=>'Phone','bsl'=>5,'quantity'=>2,'unit_cost'=>250,'sell_price'=>300})
tablet=Stock.new({'name'=>'Samsung 10.1"','manufacturer_id'=>samsung.id,'type'=>'tablet','bsl'=>4,'quantity'=>3,'unit_cost'=>150,'sell_price'=>300})


playstation.save
xbox.save
ipad.save
p30.save
tablet.save

binding.pry
nil
