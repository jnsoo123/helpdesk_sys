class TicketForm
  include ActiveModel::Model

  validates :title, presence: true
  validates :body,  presence: true

  attr_accessor(
    :ticket,
    :title,
    :body,
    :user_id,
  )

  def initialize(attr={})
    super
    set_attributes if self.ticket.present?
  end

  def save
    return false if invalid?
    create_ticket
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Ticket')
  end

  private

  def create_ticket
    Ticket.create(ticket_params)
  end

  def set_attributes
  end

  def ticket_params
    {
      title:   @title,
      body:    @body,
      user_id: @user_id
    }
  end
end
