class OfficesController < ApplicationController

  def index
    @offices = Office.all
  end

  def show
    find_office
  end

  private
  
  def find_office
    @office = Office.find(params[:id])
  end

end