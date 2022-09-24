class EntitiesController < ApplicationController # rubocop:todo Layout/EndOfLine
  before_action :set_entity, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @entities = Entity.all
  end

  def show; end

  def new
    @entity = Entity.new
    @categories = Category.where(author_id: current_user.id)
  end

  def create
    @category = Category.find(params[:category_id])
    @entity = current_user.entities.new(entity_params)

    respond_to do |format|
      if @entity.save
        @entity.categories << @category
        format.html { redirect_to category_url(@category), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :categories_id)
  end
end
