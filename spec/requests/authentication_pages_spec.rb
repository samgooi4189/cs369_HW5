require 'spec_helper'

describe "Authentication" do
	subject { page }
	
	describe "signin pages" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
	end
end
