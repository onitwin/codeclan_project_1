require_relative('../models/manufacturer')
require_relative('../models/stock')
require("pry-byebug")



sony=Manufacturer.new('name'=>'Sony')
apple=Manufacturer.new('name'=>'Apple')
samsung=Manufacturer.new('name'=>'Samsung')
huawei=Manufacturer.new('name'=>'Huwaei')

sony.save()
apple.save()
samsung.save()
huawei.save()

binding.pry
nil
