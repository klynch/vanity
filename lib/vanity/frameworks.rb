# Automatically configure Vanity.
if defined?(Rails)
  if Rails.const_defined?(:Engine) # Rails 3
    class Plugin < Rails::Engine # :nodoc:
      initializer "vanity.require" do |app|
        require 'vanity/frameworks/rails'  
        Vanity::Rails.load!
      end
    end
  else
    Rails.configuration.after_initialize do
      require 'vanity/frameworks/rails'  
      Vanity::Rails.load!
    end
  end
end
