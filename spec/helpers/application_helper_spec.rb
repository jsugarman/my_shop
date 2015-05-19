require 'rails_helper'


RSpec.describe ApplicationHelper do


	describe '#bootstrap_alert_tag' do

		it "renders bootstrap alert - basic selector match" do
			expect(helper.bootstrap_alert_tag("hello, world")).to have_selector('div.alert-success', text: /hello, world/)
		end

		it "renders a Bootstrap alert - full matcher" do
      expect(helper.bootstrap_alert_tag('Hello, World!')).to match(
        %r{<div class=\"alert alert-success alert-dismissible\" role=\"alert\">}
      ).and(match(
        %r{<button type=\"button\" class=\"close\" title=\"Close\" data-dismiss=\"alert\" aria-label=\"Close\">}
      ).and(match(
        %r{<span aria-hidden=\"true\">×</span>}
      ).and(match(
        %r{Hello, World!}
      ))))
    end

    it "can change style" do
    	expect(helper.bootstrap_alert_tag("hello, world", style: 'danger')).to match(/alert-danger/)
    end

    it "can disable dismissible" do
			expect(helper.bootstrap_alert_tag("hello, world", dismissible: false)).not_to match(/alert-dismissible/)
    end

    it "raise error for invalid keys" do
			expect{ helper.bootstrap_alert_tag("hello, world", foo: 'bar') }.to raise_error(ArgumentError)
    end

    it "raise error for invalid style" do
			expect{ helper.bootstrap_alert_tag("hello, world", style: 'foobar') }.to raise_error(ArgumentError)
    end

	end

end
