ActiveAdmin.register_page 'Uploads' do
  menu priority: 1

  controller do
    layout 'active_admin'
    require 'creek'
    def upload
      if(update_tables(saved_file_path(params[:upload][:file])))
        flash[:notice] = "Data Imported successfully"
        redirect_to action: :index
      end
    end

    def index
    end

    def update_tables(file_path)
      creek = initialize_creek(file_path)
      creek.sheets.each do |sheet|
        headers = extract_headers_from_sheet(sheet)
        sheet.rows.drop(1).each do |row|
          attr = create_row_for_table(row, headers)
          Test.create(attr)
        end
      end
    end

    def initialize_creek(file_path)
      Creek::Book.new file_path
    end

    def create_row_for_table(row,headers)
      i=0
      attr = Hash.new
      row.values.each do |value|
        attr[headers[i]]=value
        i=i+1
      end
      attr
    end

    def extract_headers_from_sheet(sheet)
      sheet.rows.first.values
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