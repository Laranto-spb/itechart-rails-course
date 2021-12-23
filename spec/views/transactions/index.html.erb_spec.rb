require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        amount_value: 2,
        person_category_id: 3
      ),
      Transaction.create!(
        amount_value: 2,
        person_category_id: 3
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
