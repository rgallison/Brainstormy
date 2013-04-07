class UsersController < ApplicationController
  # def index

  # end

  def new
  	@user = User.new
  	respond_to do |format|
  		format.html  # new.html.erb
    	format.json  { render :json => @user }
    end
  end

  def create
  	user_info = params[:user]#gets the user attributes from form - rg
    #input validation - rg
  	if !user_info.value? "" || user_info[:password] == user_info[:password2] and user_info[:email] == user_info[:email2]
      ["email2","password2"].each do |key| #delete the following keys - rg
        user_info.delete(key)
      end
	  	@user = User.new(user_info) # creates new database object - rg

	  	 	respond_to do |format|
	  		if @user.save
	  			format.html  { redirect_to(@user, :notice => 'User was successfully created.') }
	    	else
	     		format.html  { render :action => "new" }
	    	end
	    end
    else
  	 flash[:warning] = "Please try again"
  	 redirect_to home_index_path
  	end
  end

  def show
    @user=User.find(params[:id])#gets user from database - rg
  end
  
end
