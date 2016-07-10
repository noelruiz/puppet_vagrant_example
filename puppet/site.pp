


#Download and install a package

exec{ 'download_cassandra':
  command     => "wget -O /home/vagrant/cassandra-2.1.14.tar.gz http://apache.claz.org/cassandra/2.1.14/apache-cassandra-2.1.14-bin.tar.gz",
  path        => ['/usr/bin','/bin'],
  timeout     => 1200,
  #require     => Package["wget"],
}

exec { "decompress_cassandra":
	command     => "/bin/tar -zxvf /home/vagrant/cassandra-2.1.14.tar.gz",
	cwd         => "/home/vagrant/",
	require     => Exec["download_cassandra"],
}
package {'java-1.8.0-openjdk':
  ensure => installed
}

file {"/tmp/helloworld":
  content => "whats up becados 2016!!",
}

# file {'/opt/datum/'
# ensure => directory,
#   owner =>
#   group =>
#   mode => "0644"
# }
# user {'datum':
# ensure => present,
# gid => "datum"
# }
# group {'datum':
# ensure => present,
# }

# package {'curl':
# ensure => installed
# }

# package {'wget':
# ensure => installed
# }
