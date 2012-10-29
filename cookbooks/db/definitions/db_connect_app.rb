#
# Cookbook Name:: db
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.


# Sets up config file to connect application servers with database servers.

# @param [String] template Name of template that sets up the config file.
# @param [String] cookbook Name of cookbook that called this definition.
# @param [String] database Name of the database.
define :db_connect_app, :template => "db_connection_example.erb", :cookbook => "db", :database => nil do
  
  template params[:name] do
    source params[:template]
    cookbook params[:cookbook]
    mode 0440
    owner params[:owner]
    group params[:group]
    backup false
    variables(
      :user => node[:db][:application][:user],
      :password => node[:db][:application][:password],
      :fqdn => node[:db][:dns][:master][:fqdn],
      :socket => node[:db][:socket],
      :database => params[:database],
      :datasource => params[:datasource]
    )
  end

end


