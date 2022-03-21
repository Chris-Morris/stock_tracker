require "application_system_test_case"

class ScansTest < ApplicationSystemTestCase
  setup do
    @scan = scans(:one)
  end

  test "visiting the index" do
    visit scans_url
    assert_selector "h1", text: "Scans"
  end

  test "should create scan" do
    visit scans_url
    click_on "New scan"

    fill_in "Description", with: @scan.description
    fill_in "Quarterly earnings", with: @scan.quarterly_earnings
    fill_in "Title", with: @scan.title
    fill_in "Yearly earnings", with: @scan.yearly_earnings
    click_on "Create Scan"

    assert_text "Scan was successfully created"
    click_on "Back"
  end

  test "should update Scan" do
    visit scan_url(@scan)
    click_on "Edit this scan", match: :first

    fill_in "Description", with: @scan.description
    fill_in "Quarterly earnings", with: @scan.quarterly_earnings
    fill_in "Title", with: @scan.title
    fill_in "Yearly earnings", with: @scan.yearly_earnings
    click_on "Update Scan"

    assert_text "Scan was successfully updated"
    click_on "Back"
  end

  test "should destroy Scan" do
    visit scan_url(@scan)
    click_on "Destroy this scan", match: :first

    assert_text "Scan was successfully destroyed"
  end
end
