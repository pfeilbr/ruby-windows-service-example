require 'rubygems'
require 'win32/service'

include Win32

SERVICE_NAME = 'ruby_example_service'

# Create a new service
Service.create({
  :service_name        => SERVICE_NAME,
  :service_type       => Service::WIN32_OWN_PROCESS,
  :description        => 'A custom service I wrote just for fun',
  :start_type         => Service::AUTO_START,
  :error_control      => Service::ERROR_NORMAL,
  :binary_path_name   => 'c:\Ruby\bin\ruby.exe -C c:\temp ruby_example_service.rb',
  :load_order_group   => 'Network',
  :dependencies       => ['W32Time','Schedule'],
  :display_name       => SERVICE_NAME
})

# delete the service
# NOTE: if the services applet is up during this operation, the service won't be removed from that ui
# unitil you close and reopen it (it gets marked for deletion)
#Service.delete(SERVICE_NAME)