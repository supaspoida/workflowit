class StepsController < ApplicationController
  expose(:step) do
    Step.current(step_value)
  end

  expose(:step_value) do
    OpenStruct.new(params[:step]).value
  end

  def create
    render :new
  end
end
