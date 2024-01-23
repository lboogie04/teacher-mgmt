class AccountsController < ApplicationController
    layout "application"
  
    def edit
    end

    def update
      if current_user.update(user_params)
        redirect_to student_documents_path, notice: 'Account updated successfully.'
      else
        puts current_user.errors.full_messages
        render :edit
      end
    end

    private

    def user_params
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params.require(:user).permit(:name, :email, :username)
      else
        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
      end
    end
  
  end