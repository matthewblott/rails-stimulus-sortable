class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def sort
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to(@task, notice: "Task was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def status
    @task = Task.find(params[:id])
    status = params[:task][:status]
    @task.status = status.to_i
    @task.save
  end

  def update
    if @task.update(task_params)
      redirect_to(@task, notice: "Task was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @task.destroy!
    redirect_to(tasks_url, notice: "Task was successfully destroyed.", status: :see_other)
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status)
  end

end
