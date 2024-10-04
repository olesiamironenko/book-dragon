require "test_helper"

class BookAuthorRelationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_author_relation_index_url
    assert_response :success
  end

  test "should get show" do
    get book_author_relation_show_url
    assert_response :success
  end

  test "should get new" do
    get book_author_relation_new_url
    assert_response :success
  end

  test "should get create" do
    get book_author_relation_create_url
    assert_response :success
  end

  test "should get edit" do
    get book_author_relation_edit_url
    assert_response :success
  end

  test "should get update" do
    get book_author_relation_update_url
    assert_response :success
  end

  test "should get destroy" do
    get book_author_relation_destroy_url
    assert_response :success
  end
end
