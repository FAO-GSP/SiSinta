source 'https://rubygems.org'

gem 'rails', '4.2.6'

## DB
gem 'pg'
# FIXME Nuestra rama ya está mergeada en yaml_db 0.5, pero conflictúa con un
# FIXME error en activerecord-postgis-adapter:
# FIXME https://github.com/rgeo/activerecord-postgis-adapter/issues/183
gem 'yaml_db', git: 'https://github.com/mauriciopasquier/yaml_db.git', branch: 'order-join-tables'

## Aut{enticación,orización}, seguridad en general
gem 'devise'
gem 'devise-i18n'
gem 'cancancan'
gem 'rolify', '~> 3.4'
gem 'rack-cors'
gem 'jwt'

## Presentación
gem 'dynamic_form'
gem 'haml-rails'
gem 'awesome_nested_fields'
gem 'kaminari'
gem 'draper'
gem 'ransack'
gem 'rails-jquery-autocomplete'

## Modelos
gem 'paperclip'
gem 'acts-as-taggable-on'
gem 'attribute_normalizer'
gem 'inflections', '0.0.5', require: 'inflections/es'
gem 'active_model_serializers', '~> 0.8.0'
gem 'squeel', git: 'https://github.com/activerecord-hackery/squeel.git'

## GIS
gem 'activerecord-postgis-adapter'
gem 'rgeo'
gem 'rgeo-geojson', require: 'rgeo/geo_json'
# Para los datos del IGN
gem 'rubyzip'

## Controladores
gem 'responders'
gem 'has_scope'
# No funciona la inclusión automática, asique la copié a vendor
gem 'browser_detect'
gem 'rails-api'

## Assets
gem 'tinymce-rails'
# FIXME descongelar versión con rails 4.1.x (https://github.com/rails/sass-rails/issues/191#issuecomment-39155285)
gem 'sass-rails', '4.0.2'
gem 'coffee-rails'
gem 'therubyracer'
gem 'uglifier'
# FIXME Todavía no hay release compatible con rails4
gem 'multiselectjs_rails', git: 'https://github.com/mauriciopasquier/multiselectjs_rails.git'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'select2-rails'
gem 'leaflet-rails'

# Paquetes de bower
source 'https://rails-assets.org' do
  gem 'rails-assets-leaflet.markercluster'
  gem 'rails-assets-leaflet-plugins'
end

## Server
# TODO revisar configuración de compresión
gem 'dalli'

## Desarrollo pero útiles en producción
gem 'minitest-rails'
gem 'awesome_print'
gem 'pry-rails'
gem 'hirb'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'binding_of_caller'
end

group :development do
  gem 'spring'
  gem 'bullet'
  gem 'better_errors'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-passenger'
  gem 'capistrano-config_provider',
    git: 'https://github.com/mauriciopasquier/capistrano-config_provider.git',
    require: false
  gem 'brakeman', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'minitest-rails-capybara'
  gem 'selenium-webdriver'
end
