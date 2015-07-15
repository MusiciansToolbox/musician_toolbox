class TransloaditUploadsController < ApplicationController

  include Transloadit::Rails::ParamsDecoder

  def new
  end

  def create
    Rails.logger.info("PARAMS: #{params[:transloadit].inspect}")
  end
end
