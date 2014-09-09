case node['platform_family']
when 'rhel'
  polipo_rhel_package_url = 'http://devil.strangled.net/Tor_related/polipo/polipo-1.1.1-1.el6.x86_64.rpm'
  polipo_rpm = ::File.basename(polipo_rhel_package_url)
  polipo_local_rpm_path = "#{Chef::Config[:file_cache_path]}/#{polipo_rpm}"

  remote_file polipo_local_rpm_path do
    Chef::Log.info("Downloading #{polipo_local_rpm_path} from #{polipo_rhel_package_url}")
    source polipo_rhel_package_url
  end

  package polipo_rpm do
    source polipo_local_rpm_path
    provider Chef::Provider::Package::Rpm
  end
when 'debian'
  include_recipe 'apt'
  package 'polipo'
end

service 'polipo' do
  init_command '/etc/init.d/polipo'
  supports restart: true, reload: true, status: true
  action [:enable, :start]
end

template '/etc/polipo/config' do
  mode '0644'
  notifies :restart, 'service[polipo]'
end
