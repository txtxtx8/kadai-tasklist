class TasksController < ApplicationController
    before_action :require_user_logged_in, only: [:index, :show]

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
            @task = Task.new
            @task.user = current_user
        end
    end
    def edit
       @task = Task.find(params[:id])
    end
    def show
       @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
    
        if @task.update(task_params)
          flash[:success] = 'タスク修正完了'
          redirect_to @task
        else
          flash.now[:danger] = 'タスクの修正に失敗しました'
          render :edit
        end
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = 'タスクを削除しました'
        redirect_to tasks_url
    end
    
    private
    

    def task_params
        params.require(:task).permit(:content,:status)
    end
    
    
end