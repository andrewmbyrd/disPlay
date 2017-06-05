class CompaniesController < ApplicationController
  before_action :require_sign_in
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end
end
