class Note < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body

  def self.get_user_notes(user_id)
    Note.where(user: user_id)
  end

  def self.get_note_by_id(note_id)
    Note.find(note_id)
  end

  def self.create_new_note(params, user_id)
    note = Note.new
    note.user = User.find(user_id)
    note.title = params[:title]
    note.subtitle = params[:subtitle]
    note.body = params[:body]
    note.body_color = params[:body_color]
    note.title_color = params[:title_color]
    note.save
  end
end
