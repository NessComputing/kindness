#
# Author:: Josh Toft <joshtoft@gmail.com>
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2012, Josh Toft
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "homebrew"

package "postgresql"

bash "initialize postgresql database" do
  code <<-EOH
  initdb /usr/local/var/postgres
  EOH
  not_if { ::File.exists? "/usr/local/var/postgres/PG_VERSION"}
end
