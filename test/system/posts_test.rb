require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit posts_url
    click_on "New post"

    fill_in "Address", with: @post.address
    fill_in "City", with: @post.city
    fill_in "Date", with: @post.date
    fill_in "Description", with: @post.description
    fill_in "Material type", with: @post.material_type
    fill_in "Name", with: @post.name
    fill_in "Time slot", with: @post.time_slot
    fill_in "Title", with: @post.title
    fill_in "User", with: @post.user_id
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "Edit this post", match: :first

    fill_in "Address", with: @post.address
    fill_in "City", with: @post.city
    fill_in "Date", with: @post.date
    fill_in "Description", with: @post.description
    fill_in "Material type", with: @post.material_type
    fill_in "Name", with: @post.name
    fill_in "Time slot", with: @post.time_slot
    fill_in "Title", with: @post.title
    fill_in "User", with: @post.user_id
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_url(@post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
