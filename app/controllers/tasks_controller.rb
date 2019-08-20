class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :delete]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    index
    render :index
  end

  def edit
  end

  def update
    @task.update(task_params)
    index
    render :show
  end

  def delete
    @task.destroy
    index
    render :index
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
