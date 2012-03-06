# An example of modeling a state based workflow. Intended to be consumed by a
# single controller with two actions: #new & #create
class Step
  # Includes bare minimum implementation of ActiveModel interface.
  include ActiveAttr::BasicModel

  # Parent object instantiates a collection of steps. Note that 'parent' does
  # not have to refer to a class hierarchy, though it happens to also be a
  # parent class in this example.
  def self.all
    [One.new, Two.new, Three.new]
  end

  # Parent object determines the current step by iterating over all steps and
  # selecting the first one which hasn't been completed.
  def self.current(value)
    all.find do |step|
      step.current?(value)
    end || One.new
  end

  # Treat our subclasses as if they were instances of Step in the view. In this
  # example it supports the simplest usage of 'form_for'. For an implementation
  # which doesn't use subclassing this may not be needed.
  def self.model_name
    ActiveModel::Name.new(Step)
  end

  # In a real world implementation each step would implement it's own
  # definition of #current?. Essentially the inverse of #valid?
  def current?(submit_value)
    value == submit_value.to_i
  end

  # This allows each step to get it's own partial. Once again allows the
  # simplest usage of a view helper. In this case 'render step' will find a
  # partial in 'app/views/steps/_step_name.html.haml'.
  def to_partial_path
    "steps/#{self.class.name.demodulize.underscore}"
  end

  # Each step of the workflow gets a class that encapsulates any state it
  # needs as well as logic required to determine whether the step is complete
  # or not. In a real app you might instantiate these with an instance of a
  # current User. You would also likely be operating on one or more
  # domain/persistence objects within them. These essentially become services
  # wrapped around your application logic.
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
