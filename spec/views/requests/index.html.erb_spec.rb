require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        title: "Title",
        body: "MyText",
        publication: nil,
        user: nil,
        owner: 2,
        status: 'pending'
      ),
      Request.create!(
        title: "Title",
        body: "MyText",
        publication: nil,
        user: nil,
        owner: 2,
        status: 'pending'
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
