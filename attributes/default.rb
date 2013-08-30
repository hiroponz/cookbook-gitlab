# Package
if platform_family?("rhel")
  packages = %w{
    libicu-devel
  }
else
  packages = %w{
    build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev
    curl openssh-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev
  }
end
packages << 'python-docutils'

# development or production
env = "development"

# Also preparing test environment when development
case env
when "production"
  envs = %w{production}
else
  envs = %w{development test}
end

default['gitlab']['packages'] = packages
default['gitlab']['ruby'] = "1.9.3-p392"

# User
default['gitlab']['user'] = "vagrant"
default['gitlab']['group'] = "vagrant"
default['gitlab']['home'] = "/home/vagrant"

# GitLab shell
default['gitlab']['shell_repository'] = "git://github.com/gitlabhq/gitlab-shell.git"
default['gitlab']['shell_revision'] = "v1.7.0"
default['gitlab']['shell_path'] = "/vagrant/gitlab-shell"

# GitLab hq
default['gitlab']['repository'] = "git://github.com/gitlabhq/gitlabhq.git"
default['gitlab']['revision'] = "master"
default['gitlab']['path'] = "/vagrant/gitlab"

# GitLab shell config
default['gitlab']['url'] = "http://localhost:3000/"
default['gitlab']['repos_path'] = "/vagrant/repositories"
default['gitlab']['redis_path'] = "/usr/local/bin/redis-cli"
default['gitlab']['redis_host'] = "127.0.0.1"
default['gitlab']['redis_port'] = "6379"
default['gitlab']['namespace']  = "resque:gitlab"

# GitLab hq config
default['gitlab']['satellites_path'] = "/vagrant/gitlab-satellites"
default['gitlab']['git_path'] = "/usr/local/bin/git"
default['gitlab']['host'] = "localhost"
default['gitlab']['port'] = "80"
default['gitlab']['email_from'] = "gitlab@localhost"
default['gitlab']['support_email'] = "support@localhost"

# Gems
default['gitlab']['bundle_install'] = "bundle install --deployment"
default['gitlab']['env'] = env
default['gitlab']['envs'] = envs
