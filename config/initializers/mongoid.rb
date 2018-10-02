# config/initializers/mongoid.rb
module Mongoid
 module Document
   def as_json(options={})
     attrs = super(options)
     attrs.delete("_id")
     attrs
   end
 end
end
