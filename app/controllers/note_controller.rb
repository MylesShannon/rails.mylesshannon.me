class NoteController < ApplicationController
  before_filter :set_current_user, :authenticate_user!, :except => [:get_by_id]

  def index
    @notes = Note.get_user_notes(current_user.id)
    render 'note/notes', status: 200
  end

  def get_by_id
    @note = Note.get_note_by_id(params[:noteId])
    render 'note/note', status: 200
  end

  def new
    Note.create_new_note(params, current_user.id)
    @note = Note.last
    render 'note/new', status: 200
  end

  def delete
    Note.find(params[:noteId]).destroy
    render status: 200
  end
end
