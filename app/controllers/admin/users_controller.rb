module Admin
    class UsersController < Admin::BaseController
      layout "admin"

      before_action :set_user, only: [:edit, :update, :destroy]
  
      def index
        @users = if params[:role].present? && ['teacher', 'student'].include?(params[:role])
          User.with_role(params[:role])
        else
          User.where.not(id: current_user.id)
        end
      end


    def edit
    end

    def update
      # Remove existing roles
      existing_roles = @user.roles.pluck(:name)
      roles_to_remove = existing_roles - user_params[:roles]
      roles_to_remove.each { |role| @user.remove_role(role) }

      # Add new roles
      roles_to_add = user_params[:roles] - existing_roles
      roles_to_add.each { |role| @user.add_role(role) }

      if @user.update(user_params.except(:roles))
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        ## TODO: Add error alert
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :name, :status, :username, roles: [])
    end

    end
  end
  