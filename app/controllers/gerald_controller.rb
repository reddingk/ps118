class GeraldController < ApplicationController
  def index
  end

  def arnold
    @device = Device.where("userid = ?", current_user.id)
    #Device.paginate(page: params[:page])
  end

  def sid
  end
  
  def construction
  end
  
  def _per_home
    #@user = User.find(current_user.id)
    #@widgets = @user.personal_page.split(",")
    
    #if @widgets == nil
    #  @widgets = ["None", "None", "None", "None"]
    #end
  end
  
end
