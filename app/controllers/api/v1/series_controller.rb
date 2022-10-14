module Api
  module V1
    class SeriesController < ApplicationController
      def create
        result = CreationEntities::SerieService.new(serie: filter_params).call

        if result.success?
          render json: { message: 'successfully created serie' }, status: :ok
        else
          render json: { :errors => result.errors }, status: :unprocessable_entity
        end
      end

      def series
        @pagy, @series = pagy(Serie.order(id: :asc), items: 10)
        render json: { data: @series, metadata: pagy_metadata(@pagy) }, status: :ok
      end

      def serie
        serie = Serie.find_by(serie_id: params[:id])
        render json: { data: serie }, status: :ok
      end

      private

      def filter_params
        params.require(:creator_id).permit(:id, :title, :description, :startYear, :endYear, :resourceURI, :rating)
      end
    end
  end
end