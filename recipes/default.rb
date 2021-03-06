include_recipe "libbz2"
include_recipe "libreadline"

packages = Array.new

case node[:lsb][:codename]
when "lucid", "precise"
  packages |= %w/
    gpgv
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
