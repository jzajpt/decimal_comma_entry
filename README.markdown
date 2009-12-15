DecimalCommaEntry
=================

Plugin allows to enter float values to models with use of decimal comma instead of decimal point.

Example
-------

    class Product
      decimal_comma_entry :price
    end

    p = Product.new(:price => "14,60")
    p.price # => 14.60

    p = Product.new(:price => "14.60")
    p.price # => 14.60


Copyright (c) 2009 Jiri Zajpt, released under the MIT license
