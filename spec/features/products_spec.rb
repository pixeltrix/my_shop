require 'rails_helper'

RSpec.feature "Products", type: :feature do
  background do
    login_as_user
  end

  scenario "viewing products" do
    product = FactoryGirl.create(:product, name: 'Nike T-Shirt')

    visit '/products'
    expect(page).to have_text("Listing Products")

    click_link 'Show', href: "/products/#{product.id}"
    expect(page).to have_text("Name: Nike T-Shirt")
  end

  scenario "create a new product successfully" do
    visit '/products'
    expect(page).to have_text("Listing Products")

    click_link 'New Product'
    expect(page).to have_text("New Product")

    fill_in 'Name', with: "Nike T-Shirt"
    fill_in 'Description', with: "Men's T-Shirt in red"
    fill_in 'Price', with: "15.00"

    click_button 'Create Product'
    expect(page).to have_text("Product was successfully created.")
  end

  scenario "fail to create a new product" do
    visit '/products'
    expect(page).to have_text("Listing Products")

    click_link 'New Product'
    expect(page).to have_text("New Product")

    click_button 'Create Product'
    expect(page).to have_text(/\d+ errors? prohibited this product from being saved:/)
  end

  scenario "edit a product successfully" do
    product = FactoryGirl.create(:product, name: 'Nike T-Shirt')

    visit '/products'
    expect(page).to have_text("Nike T-Shirt")

    click_link 'Edit', href: "/products/#{product.id}/edit"
    expect(page).to have_text("Editing Product")

    fill_in 'Price', with: '20.00'
    click_button 'Update Product'
    expect(page).to have_text("Product was successfully updated.")
  end

  scenario "delete a product successfully" do
    product = FactoryGirl.create(:product, name: 'Nike T-Shirt')

    visit '/products'
    expect(page).to have_text("Nike T-Shirt")

    click_link 'Destroy', href: "/products/#{product.id}"
    expect(page).to have_text("Product was successfully destroyed.")
  end
end
