require 'spec_helper'

describe "Video" do

  before do
    @video = Video.create :title => 'Episode 1'
  end

  describe "create a new video" do
    it "creates a video" do
      visit videos_path
      fill_in 'video[title]', :with => 'Episode 2'
      click_button 'Save'
    end
  end

  describe "edit an existing video" do
    it "edits a video" do
      visit videos_path
      click_link "Edit"

      current_path.should == edit_video_path(@video)

      find_field('Title').value.should == 'Episode 1'

      fill_in 'Title', :with => 'Episode 1 updated!'
      click_button 'Save'

      current_path.should == videos_path
      page.should have_content 'Episode 1 updated!'
    end
  end

  describe "Get /videos" do
    it "display some videos" do
      visit videos_path
      page.should have_content 'Episode 1'
    end
  end

end
