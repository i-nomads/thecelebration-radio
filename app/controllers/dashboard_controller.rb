class DashboardController < ApplicationController
  before_action :setup_vlc_client

  def control
    @vlc.play_next(params[:url])
    Dir.glob("/Users/clabesse/Music/Bowen FM/Live/*").shuffle.each do |file|
      @vlc.add_to_playlist Dir.glob("/Users/clabesse/Music/Bowen FM/Jingles/*").sample
      @vlc.add_to_playlist file
    end
    redirect_to root_path
  end

  protected

  def setup_vlc_client
    @vlc = VLC::Client.new('192.168.0.22', 8888)
    @vlc.connect
  end
end
