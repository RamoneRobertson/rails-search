class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_by_title_and_synopsis(params[:query])
      # Search where query is IN title or synopsis
      # sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      # @movies = Movie.where( sql_query, query: "%#{params[:query]}%")

      # ASSOCIATION SEARCH
      # sql_query = <<~SQL
      #   movies.title ILIKE :query
      #   OR movies.synopsis ILIKE :query
      #   OR directors.first_name ILIKE :query
      #   OR directors.last_name ILIKE :query
      # SQL

      # FULL TEXT SEARCH
      #  sql_query = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL

      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

    else
      @movies = Movie.all
    end
  end
end
