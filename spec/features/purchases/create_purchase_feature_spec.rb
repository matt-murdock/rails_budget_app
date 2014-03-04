require 'spec_helper'

describe "creating purchase process" do

  it "creates a new purchase" do
    visit '/purchases/new'

    fill_in 'purchase_type', :with => 'Purchase Type'
    fill_in 'purchase_sub_type', :with => 'The Sub Type'
    fill_in 'purchase_cost', :with => 'The Cost of the Purchase'
    fill_in 'purchase_date', :with => '01-01-2014'

    click 'submit'

    expect page 'to have purchase'
  end

  it 'throws an error if purchase is invalid' do
    visist '/purchase/new'

    click 'submit'
    expect page 'to have error'
  end
end