class Step
  include ActiveAttr::BasicModel

  def self.all
    [One.new, Two.new, Three.new]
  end

  def self.current(value)
    all.find do |step|
      step.current?(value)
    end || One.new
  end

  def self.model_name
    ActiveModel::Name.new(Step)
  end

  def current?(submit_value)
    value == submit_value.to_i
  end

  def to_partial_path
    "steps/#{self.class.name.demodulize.underscore}"
  end

  class One < Step
    def value; nil end
  end
  class Two < Step
    def value; 2 end
  end
  class Three < Step
    def value; 3 end
  end
end
