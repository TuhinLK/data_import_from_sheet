class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new

  end
  def import_users
    if params[:excel_file].present?
      failed_data = ""
      file = params[:excel_file]
      xlsx = case File.extname(file.original_filename)
             when ".csv" then Roo::Spreadsheet.open(file, extension: :csv)
             when ".xls" then Roo::Spreadsheet.open(file, extension: :xls)
             when ".xlsx" then Roo::Spreadsheet.open(file, extension: :xlsx)
             else raise "Unknown file type: #{file.original_filename}"
             end
      count = xlsx.count
      failed_count = 0
      accept_count = 0

      for i in 1...count do
        first_name = xlsx.row(i+1)[0]
        last_name = xlsx.row(i+1)[1]
        email_id = xlsx.row(i+1)[2]

        @user = User.new(first_name: first_name, last_name: last_name, email_id: email_id)
        if @user.save
          accept_count += 1
        else
          p @user.errors.full_messages
          failed_count += 1
          @user.errors.each do |error|
            failed_data += "#{error.full_message}"
          end
        end
      end
      p "*************************************"
      p failed_data
      redirect_to root_path
    end
  end

end
