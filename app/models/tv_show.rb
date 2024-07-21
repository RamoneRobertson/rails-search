class TvShow < ApplicationRecord
  # We can search both models movies and tv shows by using this
  include PgSearch::Model
  multisearchable against: [:title, :synopsis]
end
