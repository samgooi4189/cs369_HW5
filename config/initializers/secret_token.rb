# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# SampleApp::Application.config.secret_key_base = 'a95a23ba64743b0c0b28bb056c90251f5d2d0feb7925a623f514bbae26d4faf237449b83022d8cc7e3a93a14a8fd83d3d686c49a21b3053b9adfae7c07911a23'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret');
	if File.exist? (token_file)
		#use the existing token
		File.read(token_file).chomp;
	else
		#generate new toke and store it in token_file
		token = SecureRandom.hex(64);
		File.write(token_file, token);
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token
