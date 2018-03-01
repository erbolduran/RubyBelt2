class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user.id
      return redirect_to products_path
    end
  
    flash[:error] = user.errors.full_messages

    return redirect_to :back
  end

  def index
    return render text: "Herrro!"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    reset_session
    return redirect_to "/"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
