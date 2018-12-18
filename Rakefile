def launch_with(config_filename)
  system("rspec --require ./config/#{config_filename}")
end

namespace :local do
  BROWSERS_LOCAL = [ 'firefox', 'chrome' ]
  BROWSERS_LOCAL.each do |browser|
    desc "Run tests locally on #{browser.capitalize}"
    task browser.to_sym do
      ENV['browser'] = browser
      launch_with('local_config.rb')
    end
  end
end

