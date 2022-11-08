# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'requests/show', type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
                                  title: 'Title',
                                  body: 'MyText',
                                  publication: nil,
                                  user: nil,
                                  owner: 2,
                                  status: 'pending'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
