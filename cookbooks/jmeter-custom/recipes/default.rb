#
# Custom cookbook for installing JMeter as the official one
# will not work with my vagrant
#
#
ark 'jmeter' do
  url 'http://mirror.cogentco.com/pub/apache//jmeter/binaries/apache-jmeter-2.13.zip'
  version '2.13'
  owner 'vagrant'
  action :install
end

