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
        format.html { redirect_to records_path, notice: 'Portfolio Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @record_item = Record.find(params[:id])
  end

  def update
    @record_item = Record.find(params[:id])

    respond_to do |format|
      if @record_item.update(params.require(:record).permit(:title, :subtitle, :body))
        format.html { redirect_to records_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @record_item = Record.find(params[:id])
  end

  def destroy
    @record_item = Record.find(params[:id])

    @record_item.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record item was successfully destroyed.' }
    end
  end

  private


  def portfolio_params
    params.require(:record).permit(:title, :subtitle, :body)
  end
end
