# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'requests/edit', type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
                                  title: 'MyString',
                                  body: 'MyText',
                                  publication: nil,
                                  user: nil,
                                  owner: 1,
                                  status: 'pending'
                                ))
  end

  it 'renders the edit request form' do
    render

    assert_select 'form[action=?][method=?]', request_path(@request), 'post' do
      assert_select 'input[name=?]', 'request[title]'

      assert_select 'textarea[name=?]', 'request[body]'

      assert_select 'input[name=?]', 'request[publication_id]'

      assert_select 'input[name=?]', 'request[user_id]'

      assert_select 'input[name=?]', 'request[owner]'

      assert_select 'input[name=?]', 'request[status]'
    end
  end
end
