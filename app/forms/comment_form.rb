class CommentForm
  include ActiveModel::Model

  attr_accessor(
    :comment,
    :user_id,
    :ticket_id,
    :body
  )

  validates :body, presence: true

  def initialize(attr={})
    super
    set_attributes if self.comment.present?
  end

  def save
    return false if invalid?
    create_comment
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Comment')
  end

  private

  def set_attributes
    @user_id   ||= self.user_id
    @ticket_id ||= self.ticket_id
    @body      ||= self.body
  end

  def create_comment
    Comment.create(comment_params)
  end

  def comment_params
    {
      user_id:   @user_id,
      ticket_id: @ticket_id,
      body:      @body
    }
  end
end
