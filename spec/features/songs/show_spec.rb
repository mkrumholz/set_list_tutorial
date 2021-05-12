require 'rails_helper'

RSpec.describe 'songs show' do
  before(:each) do
    artist = Artist.create(name: 'Carly Rae Jepsen')
    @song_1 = artist.songs.create!(title: "I Really Like You",
                         length:      208,
                         play_count:  243810867)
    @song_2 = artist.songs.create!(title: "Call Me Maybe",
                         length:      199,
                         play_count:  1214722172)
  end

  it 'displays the song title' do
    visit "/songs/#{@song_1.id}"

    expect(page).to have_content(@song_1.title)
    expect(page).to_not have_content(@song_2.title)
  end

  it 'displays the artist name' do
    
  end

  # it 'takes me back to the songs index page' do
  #   #   As a user
  #   # When I visit a Song show page
  #   # I see a link back to the songs index page
  #   # When I click this link
  #   # Then I am taken to the songs index
  #
  #
  # end
end
