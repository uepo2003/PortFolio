class SearchesController < ApplicationController
  def search
    if params[:search_type] == "AND"
      @results = Company.search('AND', params[:field1], params[:value1], params[:field2], params[:value2])
    else # OR
      @results = Company.search('OR', params[:field1], params[:value1], params[:field2], params[:value2])
    end
  end
end
