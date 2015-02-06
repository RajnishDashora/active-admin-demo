ActiveAdmin.register_page 'Uploads' do
  menu priority: 1

  controller do
    layout 'active_admin'
    require 'creek'
    def upload
      file_path=saved_file_path(params[:upload][:file])
      if(file_path)
        creek = Creek::Book.new file_path
        sheet= creek.sheets[0]
        sheet.rows.each do |row|
          puts row
        end
        
        flash[:notice] = "Data Imported successfully"
        redirect_to action: :index
      end
    end

    def index
    end

    private
    def saved_file_path(upload_file)
      if upload_file
        FileUtils.rm_f(Rails.root.join('public', 'uploads', '*'))
        Rails.root.join('public', 'uploads', upload_file.original_filename).tap do |file_path|
          File.open(file_path, 'wb') { |file| file.write(upload_file.read) }
        end
      end
    end
  end

end