class Post < ApplicationRecord
  has_many :comments

  scope :paginate, -> (page:, per_page: 10) {
    page = (page || 1).to_i

    current_scope = limit(per_page).offset((page - 1) * per_page)

    PaginationResult.new(current_scope).tap do |result|
      result.current_page = page
      result.total_pages = (count / per_page.to_f).ceil
    end
  }

  class PaginationResult < SimpleDelegator
    attr_accessor :current_page, :total_pages
  end
end
