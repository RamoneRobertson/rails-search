class Movie < ApplicationRecord
  belongs_to :director

  # Include the module PgSearch
  include PgSearch::Model
  # This allows you to search for multiple models
  multisearchable against: [:title, :synopsis]

  # Name a method (search_by_title_and_synopsis)
  # pg_search_scope :search_by_title_and_synopsis,
    # Tell pgsearch which columns to search through model director using their first and last anme
    # against: [ :title, :synopsis ],
    # associated_against: {
      # Since there is an association between the director and movie we
    #   director: [ :first_name, :last_name ]
    # },
    # using: {
      # tsearch is the same as full text search
      # tsearch: { prefix: true } # This means you dont have to type the entire word for it to be true
      # tesearch -> same as @@ in postgres
    # }
end
