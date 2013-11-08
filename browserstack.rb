#!/usr/bin/env ruby

require "screenshot"
require "dotenv"

Dotenv.load
settings = {
  username: ENV["BROWSERSTACK_USER"],
  password: ENV["BROWSERSTACK_PASS"]
}

client = Screenshot::Client.new(settings)
