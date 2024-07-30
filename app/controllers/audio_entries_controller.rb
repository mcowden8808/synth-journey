class AudioEntriesController < ApplicationController
  def index
    @audio_entries = AudioEntry.all
  end

  def show
  end

  def new
    @audio_entry = AudioEntry.new
  end

  def create
    @audio_entry = AudioEntry.new(audio_entry_params)

    if @audio_entry.save
      redirect_to @audio_entry, notice: 'Audio entry was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @audio_entry.update(audio_entry_params)
      redirect_to @audio_entry, notice: 'Audio entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @audio_entry.destroy
    redirect_to audio_entries_url, notice: 'Audio entry was successfully destroyed.'
  end

  private

  def set_audio_entry
    @audio_entry = AudioEntry.find(params[:id])
  end

  def audio_entry_params
    params.require(:audio_entry).permit(:title, :description, :audio_file)
  end
end
