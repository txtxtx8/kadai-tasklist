class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:destroy,:edit,:show,:update]

    def index
        if logged_in?
            @tasks = current_user.tasks.order(id: :desc).page(params[:page])
        end
    end
    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            flash[:success] = 'タスクが追加されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクの追加に失敗しました'
            render :new
        end
    end
    
    def new
      if logged_in?
        @task = current_user.tasks.new
      end
    end
    
    def edit
    end
    
    def show
    end
    
    def update
        if @task.update(task_params)
          flash[:success] = 'タスク修正完了'
          redirect_to @task
        else
          flash.now[:danger] = 'タスクの修正に失敗しました'
          render :edit
        end
    end
    
    def destroy
        @task.destroy
        flash[:success] = 'タスクを削除しました'
        redirect_to tasks_url
    end
    
    private
    

    def task_params
        params.require(:task).permit(:content,:status)
    end
    
    def correct_user
     @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to root_url
      end
    end
end