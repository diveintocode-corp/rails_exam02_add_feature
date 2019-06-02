
class BaseServiceModel

  attr_accessor :errors
  attr_accessor :attr

  def initialize(h = {})
    @attr = h.dup
    errors = []
    h.keys.each do |prop|
      self.instance_eval %Q{
        def #{prop.to_s}
          @attr["#{prop}".intern] || ""
        end
        def #{prop.to_s}=(arg)
          @attr["#{prop}".intern]= arg
       end
      }
    end
  end

end

module BaseServiceImpl

 def run
   raise NotImplementedError
 end

 def build_associate
   raise NotImplementedError
 end

 def validate
   raise NotImplementedError
 end
end
