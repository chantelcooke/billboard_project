class SongsController < ApplicationController
  before_action :set_artist
  # Model name - song
  # parent - artist
  def index
    # @songs = Song.all
    @songs = @artist.songs
    render component: 'Songs', props: { artist: @artist, songs: @songs }
  end

  def show
    @song = @artist.songs.find(params[:id])
    render component: 'Song', props: { artist: @artist, song: @song }
  end

  def new
    @song = Song.new
    render component: 'SongNew', props: { song: @song }
  end

  def create
    @song = Song.new(song_params)
    if song.save 
      #do something
    else
      render component: 'SongNew', props: { song: @song }  
    end
  end

  def edit
    @song = Song.find(params[:id])
    render component: 'SongEdit', props: { song: @song }
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      #do something
    else
      render component: 'SongEdit', props: { song: @song }  
    end  
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    #send something
  end

  private 
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
end