#
# Author:: Seth Falcon (<seth@opscode.com>)
# Copyright:: Copyright 2011 Opscode, Inc.
# License:: Apache License, Version 2.0
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

module OpscodeAcl
  class UserList < Chef::Knife
    category "OPSCODE HOSTED CHEF ACCESS CONTROL"
    banner "knife user list"
    
    deps do
      require 'pp'
    end

    def run
      chef_rest = Chef::REST.new(Chef::Config[:chef_server_url])
      users = chef_rest.get_rest("users").map { |u| u["user"]["username"] }
      pp users.sort
    end
  end
end

