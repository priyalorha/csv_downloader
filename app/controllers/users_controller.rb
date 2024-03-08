# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def download_csv
    CsvGenerationWorker.perform_async(params[:id])
    redirect_to root_path, alert: 'processing!!!'
  end
end
