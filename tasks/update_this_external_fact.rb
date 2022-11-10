#! /opt/puppetlabs/puppet/bin/ruby
# task to edit specific fact 'this_external_fact'
require 'facter'
require 'json'
require 'yaml'
params = JSON.parse(STDIN.read)
ephemeral = params['ephemeral']
tempmarker = params['tempmarker']
version = params['version']

extfactdir = if Facter.value('os')['family'] == 'windows'
               'C:/ProgramData/PuppetLabs/facter/facts.d'
             else
               '/etc/puppetlabs/facter/facts.d'
             end
factname = 'this_external_fact'
data = {
  factname => {
    'ephemeral'  => ephemeral,
    'tempmarker' => tempmarker,
    'version'    => version,
  },
}.to_yaml

File.open("#{extfactdir}/#{factname}.yaml", 'w') do |file|
  file.write(data)
  file.chmod(0o0644)
end
puts "Set '#{factname}: #{deployed}' in #{extfactdir}/#{factname}.yaml"
