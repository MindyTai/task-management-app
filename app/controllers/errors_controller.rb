class ErrorsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render template: 'errors/errors', status: 404 }
    end
  end

end
