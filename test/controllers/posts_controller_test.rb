# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url,
           params: { post: { author_id: @post.author_id, body: @post.body, favorites_count: @post.favorites_count,
                             follows_count: @post.follows_count, post_type: @post.post_type, replies_count: @post.replies_count, tags_count: @post.tags_count, title: @post.title, votes_count: @post.votes_count } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post),
          params: { post: { author_id: @post.author_id, body: @post.body, favorites_count: @post.favorites_count,
                            follows_count: @post.follows_count, post_type: @post.post_type, replies_count: @post.replies_count, tags_count: @post.tags_count, title: @post.title, votes_count: @post.votes_count } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
