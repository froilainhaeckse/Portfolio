class RecordsController < ApplicationController
  def index
    @record_items = Record.all
  end

  def new
    @record_item = Record.new
  end

  def create
    @record_item = Record.new(params.require(:record).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @record_item.save
        format.html { redirect_to records_url, notice: 'Portfolio Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end
