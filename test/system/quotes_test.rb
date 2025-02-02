require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test "Creating new quote" do

    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New quote"
    assert_selector "h1", text: "New quote"

    fill_in "Name", with: "Test Note"
    click_on "Create Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Test Note"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated Quote"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated Quote"
  end

  test "Deleting a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
