class StaticProjectsController < ApplicationController
  layout :choose_layout

  def show
    render template: "static_projects/#{params[:page]}"
  end

  private

  def choose_layout
    params[:page]
  end
end
