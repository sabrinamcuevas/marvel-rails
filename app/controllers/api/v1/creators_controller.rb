module Api
  module V1
    class CreatorsController < ApplicationController
      def create
        result = CreationEntities::CreatorService.new(creator: filter_params).call

        if result.success?
          render json: { message: 'successfully created creator' }, status: :ok
        else
          render json: { :errors => result.errors }, status: :unprocessable_entity
        end
      end

      def creators
        @pagy, @creators = pagy(Creator.order(id: :desc), items: 10)
        render json: { data: @creators, metadata: pagy_metadata(@pagy) }, status: :ok
      end

      def creator
        creator = Creator.find_by(creator_id: params[:id])
        return not_found if creator.nil?

        render json: { data: creator }, status: :ok
      end

      private

      def filter_params
        params.permit(:id, :firstName, :lastName, :resourceURI)
      end
    end
  end
end
