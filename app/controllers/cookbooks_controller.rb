class CookbooksController < ApplicationController
  before_action :set_cookbook, only: %i[ show edit update destroy ]

  def index
    @cookbooks = Cookbook.all.order(name: :asc)
  end

  def show
  end

  def new
    @cookbook = Cookbook.new
  end

  def edit
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)

    respond_to do |format|
      if @cookbook.save
        format.html { redirect_to cookbook_url(@cookbook), notice: "Cookbook was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cookbook.update(cookbook_params)
        format.html { redirect_to cookbook_url(@cookbook), notice: "Cookbook was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cookbook.destroy

    respond_to do |format|
      format.html { redirect_to cookbooks_url, notice: "Cookbook was successfully destroyed." }
    end
  end

  private
    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end

    def cookbook_params
      params.require(:cookbook).permit(:name, :description)
    end
end
