class RecordsController < ApplicationController
  def index
    @record_items = Record.all
  end
end
