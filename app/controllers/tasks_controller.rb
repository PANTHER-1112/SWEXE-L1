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
        redirect_to task_path(@task), status: :see_other
    else
        render :new, status: 422
    end
    end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), status: :see_other
    else
      render :edit, status: 422
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :subject, :deadline, :memo)
  end
end