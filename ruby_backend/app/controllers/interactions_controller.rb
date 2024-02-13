class InteractionsController < ApplicationController
  before_action :load_interactions, except: [:get_status_interaction_types, :index, :create]

  def index
    interactions = Interaction.all
    interactions = interactions.map{|interaction| {id: interaction.id, status: interaction.status, interaction_type: interaction.interaction_type, date: interaction.date.strftime("%d/%m/%Y, %H:%M:%S"), customer: interaction.customer}}
    render json: {interactions: interactions}
  end

  def get_status_interaction_types
    render json: {interaction_types: Interaction.interaction_types.keys, statuses: Interaction.statuses.keys}
  end

  def show
    render json: @interaction
  end

  def create
    interaction = Interaction.new(interaction_params)
    if interaction.save
      render json: interaction
    else
      render json: {errors: interaction.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @interaction.update(interaction_params)
      render json: @interaction
    else
      render json: {errors: @interaction.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @interaction.destroy
      render json: {message: "Successfully destroyed interaction."}, status: :ok
    else
      render json: {errors: interaction.errors}, status: :unprocessable_entity
    end
  end

  private

  def load_interactions
    @interaction = Interaction.find(params[:id])
  end

  def interaction_params
    params.require(:interaction).permit(:status, :interaction_type, :date, :status, :customer_id)
  end
end
