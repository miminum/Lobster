class Conversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages, dependent: :destroy
  

  validates_uniqueness_of :sender_id, :scope => :recipient_id
  validate :cannot_message_self
  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end

  def conversation_with (user)
    if self.sender == user
      recipient = User.find(self.recipient_id)
    else
      recipient = User.find(self.sender_id)
    end
    recipient
  end

  private  
  def cannot_message_self
    notice.add(:sender_id, 'Cannot Message yourself') if sender_id == recipient_id
  end  
end
