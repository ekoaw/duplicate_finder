require 'yaml'
require_relative 'DupeFinder'

config = YAML::load_file('config.yaml')

if !config.has_key? 'path' or !config['path'].is_a? String
  config['path'] = ''
end

if !config.has_key? 'pattern' or !config['pattern'].is_a? String
  config['pattern'] = '*'
end

if !config.has_key? 'recursive' or ![true, false].include? config['recursive']
  config['recursive'] = true
end

finder = DupeFinder.new(config['path'], config['pattern'], config['recursive'])
finder.run()