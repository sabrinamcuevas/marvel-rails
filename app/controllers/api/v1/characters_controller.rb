module Api
  module V1
    class CharactersController < ApplicationController
      def create
        result = CreationEntities::CharacterService.new(character: filter_params).call

        if result.success?
          render json: { message: 'successfully created character' }, status: :ok
        else
          render json: { :errors => result.errors }, status: :unprocessable_entity
        end
      end

      def characters
        @pagy, @characters = pagy(Character.order(id: :desc), items: 10)
        render json: { data: @characters, metadata: pagy_metadata(@pagy) }, status: :ok
      end

      def character
        character = Character.find_by(character_id: params[:id])
        return not_found if character.nil?

        render json: { data: character }, status: :ok
      end

      private

      def filter_params
        params.require(:comicId).permit(:id, :name, :description, :resourceURI, :page)
      end
    end
  end
end