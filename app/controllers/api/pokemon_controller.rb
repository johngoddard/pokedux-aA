class Api::PokemonController < ApplicationController
  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages, status: 422
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    render :show
  end

  def index
    @pokemon = Pokemon.all
  end

  def show
    sleep(1)
    @pokemon = Pokemon.find(params[:id])
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :image_url, :attack, :defense, :name, :poke_type, moves: []
    )
  end
end
