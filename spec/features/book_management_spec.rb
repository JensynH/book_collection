# File for integration tests

require 'rails_helper'

RSpec.describe 'Book Management', type: :feature do
  scenario 'User successfully adds a book with all attributes' do
    visit new_book_path

    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '9.99'
    fill_in 'Published Date (YYYY-MM-DD)', with: Date.today.strftime("%Y-%m-%d")  # Use current date
    
    # Troubleshooting test
    # puts "Page content after submitting form:"
    # puts page.body  # This will print out the full HTML content of the page

    click_button 'Create Book'

    expect(page).to have_content('Book successfully created.')
    expect(page).to have_content('Test Book')
    expect(page).to have_content('Test Author')
    expect(page).to have_content('9.99')
    # expect(page).to have_content(Date.today.strftime("%Y-%m-%d"))  # Ensure today's date is displayed correctly
  end

  scenario 'User fails to add a book with missing title' do
    visit new_book_path

    fill_in 'Title', with: ''
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '9.99'
    fill_in 'Published Date (YYYY-MM-DD)', with: '2002-01-15'

    click_button 'Create Book'

    expect(page).to have_content("Title can't be blank")
  end

  scenario 'User fails to add a book with missing author' do
    visit new_book_path

    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '9.99'
    fill_in 'Published Date (YYYY-MM-DD)', with: '2002-01-15'
    
    click_button 'Create Book'

    expect(page).to have_content("Author can't be blank")
  end

  scenario 'User fails to add a book with missing price' do
    visit new_book_path

    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: ''
    fill_in 'Published Date (YYYY-MM-DD)', with: '2002-01-15'
    
    click_button 'Create Book'

    expect(page).to have_content("Price can't be blank")
  end

  scenario 'User fails to add a book with missing published date' do
    visit new_book_path

    fill_in 'Title', with: 'Test Book'
    fill_in 'Author', with: 'Test Author'
    fill_in 'Price', with: '9.99'
    fill_in 'Published Date (YYYY-MM-DD)', with: ''
    
    click_button 'Create Book'

    expect(page).to have_content("Published date can't be blank")
  end
end

# RSpec.describe 'Book Management', type: :feature do
#   scenario 'User successfully adds a book with title' do
#     visit new_book_path

#     fill_in 'Title', with: 'Test Book'
#     click_button 'Create Book'

#     expect(page).to have_content('Book successfully created.')
#     expect(page).to have_content('Test Book')
#   end

#   scenario 'User fails to add a book with missing title' do
#     visit new_book_path

#     fill_in 'Title', with: ''
#     click_button 'Create Book'

#     expect(page).to have_content("Title can't be blank")
#   end
# end
