ActiveAdmin.register_page 'Uploads' do
  menu priority: 1

  controller do
    layout 'active_admin'
    skip_before_filter :verify_authenticity_token

    def upload
      #understading the flow for flash and redirection to the index page 
      flash[:notice] = "Data Imported successfully"
      redirect_to action: :index
    end

    def index

    end
  end

end