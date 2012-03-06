class StepsController < ApplicationController
  # The view is provided an instance of the current step. All logic relating to
  # what the current step actually is lives outside the controller. Pass any
  # state required to persist & determine whether a step is complete or not. In
  # a real app this would probably be the current user as well as params from
  # form submission.
  expose(:step) do
    Step.current(step_value)
  end

  expose(:step_value) do
    OpenStruct.new(params[:step]).value
  end

  # Since we are not actually saving any state in this example we just render
  # the current step again. In a real app each step might implement a #save
  # method and we would redirect back to #new if the save was successful.
  def create
    render :new
  end
end
