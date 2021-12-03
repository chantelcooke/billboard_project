class Artist < ApplicationRecord
  belongs_to :Billboard
  before_action :set_billboard

  # Model name - Artist
  def index
    # @artist = Artist.all 
    @artist = @billboard.artist
    render component: 'artist', props: { billboard: @billboard, artist: @artist, taco: 'tuesday' }
  end

  def show
    # @topic = Artist.find(params[:id])
    @topic = @billboard.artist.find(params[:id])
    render component: 'Artist', props: { billboard: @billboard, topic: @topic }
  end

  def new
    # @topic = Artist.new
    @topic = @billboard.artist.new
    render component: 'ArtistNew', props: { billboard: @billboard, topic: @topic }
  end

  def create
    # @topic = Artist.new(topic_params)
    @topic = @billboard.artist.new(topic_params)
    if @topic.save
      redirect_to billboards_path
    else
      render component: 'ArtistNew', props: { billboard: @billboard, topic: @topic }
    end
  end

  def edit
    # @topic = Artist.find(params[:id])
    @topic = @billboard.artist.find(params[:id])
    render component: 'ArtistEdit', props: { billboard: @billboard, topic: @topic }
  end

  def update
    # @topic = Artist.find(params[:id])
    @topic = @billboard.artist.find(params[:id])
    if @topic.update(topic_params)
      redirect_to billboards_path
    else
      render component: 'ArtistEdit', props: { billboard: @billboard, topic: @topic }
    end
  end

  def destroy
    # @topic = Artist.find(params[:id])
    @topic = @billboard.artist.find(params[:id])
    @topic.destroy
    redirect_to billboards_path
  end

  private 
    def set_billboard
      @billboard = billboard.find(params[:billboard_id])
    end

    def topic_params
      params.require(:topic).permit(:title, :body)
    end
  end  
end