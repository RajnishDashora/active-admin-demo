ActiveAdmin.register_page 'Uploads' do
  menu priority: 1

  controller do
    layout 'active_admin'
    skip_before_filter :verify_authenticity_token

    def upload
      file_path=saved_file_path(params[:upload][:file])
      if(file_path)
        flash[:notice] = "Data Imported successfully"
        redirect_to action: :index
      end
    end
    
    def index
    end

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