class RecordsController < ApplicationController
  before_action :set_record_item, only: %i[show edit update destroy]

  def index
    @record_items = Record.all
  end

  def new
    @record_item = Record.new
  end

  def create
    @record_item = Record.new(portfolio_params)

    respond_to do |format|
      if @record_item.save
        format.html { redirect_to records_path, notice: 'Portfolio Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @record_item.update(params.require(:record).permit(:title, :subtitle, :body))
        format.html { redirect_to records_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @record_item.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record item was successfully destroyed.' }
    end
  end

  private
  
  def set_record_item
    @record_item = Record.find(params[:id])
  end


  def portfolio_params
    params.require(:record).permit(:title, :subtitle, :body)
  end
end
