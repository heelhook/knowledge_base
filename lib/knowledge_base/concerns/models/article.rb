module KnowledgeBase::Concerns::Models::Article
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    publishable on: :published_at

    friendly_id :title, use: :slugged

    has_many :category_article_associations
    has_many :categories, through: :category_article_associations
    has_many :sections, -> { order 'position ASC' }, as: :container,
      dependent: :destroy

    accepts_nested_attributes_for :category_article_associations
    accepts_nested_attributes_for :sections, allow_destroy: true

    def to_s
      title
    end
  end
end
