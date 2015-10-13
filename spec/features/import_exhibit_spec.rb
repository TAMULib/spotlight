require 'spec_helper'
require 'tempfile'

describe 'Allow exhibit admins to import and export content from an exhibit', type: :feature, js: true do
  let(:exhibit) { FactoryGirl.create(:default_exhibit) }
  let(:user) { FactoryGirl.create(:exhibit_admin, exhibit: exhibit) }
  before { login_as user }

  pending 'should allow admins to export content from an exhibit' do
    pending(%(There's not really any good way to test the contents of a
downloaded file with Poltergeist (which is now necessary since we've moved
the export option behind a bootstrap tab)))
    visit spotlight.exhibit_home_page_path(exhibit, exhibit.home_page)

    click_link user.email
    within '#user-util-collapse .dropdown-menu' do
      click_link 'Dashboard'
    end

    click_link 'Settings'
    within('.nav-tabs') do
      click_link 'Export data'
    end
    within('#export') do
      click_link 'Export data'
    end

    data = JSON.parse(page.body)

    expect(data).to include 'title', 'searches', 'home_page'
  end

  it 'allows admins to import content into an exhibit' do
    pending 'PhantomJS 2.0.0 is unable to upload files; see https://github.com/ariya/phantomjs/issues/12506'
    visit spotlight.exhibit_home_page_path(exhibit, exhibit.home_page)

    click_link user.email
    within '#user-util-collapse .dropdown-menu' do
      click_link 'Dashboard'
    end

    click_link 'Settings'

    within('.nav-tabs') do
      click_link 'Import data'
    end

    file = Tempfile.new('foo')
    file.write({ 'title' => 'A better title' }.to_json)
    file.rewind
    begin
      attach_file('file', File.expand_path(file.path))
      within('#import') do
        click_button 'Import data'
      end
    ensure
      file.close
      file.unlink
    end
    expect(page).to have_content 'The exhibit was successfully updated.'
    expect(page).to have_content 'A better title'
  end
end
