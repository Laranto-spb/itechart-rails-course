require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      amount_value: 1,
      person_category_id: 1
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[amount_value]"

      assert_select "input[name=?]", "transaction[person_category_id]"
    end
  end
end
