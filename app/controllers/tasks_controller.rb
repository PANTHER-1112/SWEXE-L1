class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(:deadline)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task),
                  notice: "課題を登録しました。",
                  status: :see_other
    else
      flash.now[:alert] = "登録できませんでした。入力内容を確認してください。"
      render :new, status: 422
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task),
                  notice: "課題を更新しました。",
                  status: :see_other
    else
      flash.now[:alert] = "更新できませんでした。入力内容を確認してください。"
      render :edit, status: 422
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path,
                  notice: "課題を削除しました。",
                  status: :see_other
    else
      redirect_to task_path(@task),
                  alert: "課題を削除できませんでした。",
                  status: :see_other
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :subject, :deadline, :memo)
  end
end