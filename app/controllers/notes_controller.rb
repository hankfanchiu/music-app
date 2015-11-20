class NotesController < ApplicationController
  before_action :require_login
  before_action :current_user_is_note_writer, only: [:edit, :update]
  before_action :forbid_destroy_by_non_note_writer, only: :destroy

  def create
    @note = current_user.notes.new(note_params)

    unless @note.save
      flash[:errors] = @note.errors.full_messages
    end

    @track = @note.track
    redirect_to track_url(@track.id)
  end

  def edit
    @note = Note.find(params[:id])
    render :edit
  end

  def update
    @note = Note.find(params[:id])

    unless @note.update(note_params)
      flash.now[:errors] = @note.errors.full_messages
    end

    @track = @note.track
    redirect_to track_url(@track.id)
  end

  def destroy
    @note = Note.destroy(params[:id])

    @track = @note.track
    redirect_to track_url(@track.id)
  end

  private

  def note_params
    params.require(:note).permit(:text, :track_id)
  end

  def current_user_is_note_writer
    found_note = current_user.notes.find(params[:id])

    redirect_to bands_url unless found_note
  end

  def forbid_destroy_by_non_note_writer
    found_note = current_user.notes.find(params[:id])

    render text: "403 FORBIDDEN" unless found_note
  end
end
