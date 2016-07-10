
$user       = "kittens"
$group      = "kittens"
$base_dir   = "/home/${user}/node"
$cassandra  = "http://apache.claz.org/cassandra/2.1.14/apache-cassandra-2.1.14-bin.tar.gz"
# ----------------------------- Adding Desired User ----------------------------
user {$user:
  ensure      => present,
  gid         => $group,
  managehome  => true,
  require     => Group[$group]
}
group {$group:
  ensure      => present,
}
file {$base_dir:
  ensure      => directory,
  owner       => $user,
  group       => $group,
  mode        => "755",
  require     => User[$user],
}

#Download and install a package

exec{ 'download_cassandra':
  command     => "wget -O ${$base_dir}/cassandra-2.1.14.tar.gz ${cassandra}",
  path        => ['/usr/bin','/bin'],
  timeout     => 1200,
  require     => [Package["wget"],File[$base_dir]],
}

exec { "decompress_cassandra":
	command     => "/bin/tar -zxvf ${$base_dir}/cassandra-2.1.14.tar.gz",
	cwd         => "${$base_dir}",
	require     => Exec["download_cassandra"],
}
package {'java-1.8.0-openjdk':
  ensure      => installed
}
package {'wget':
  ensure      => installed,
}
file {"${base_dir}/installed":
  content     => "\nmodule installed!\n",
  require     => File[$base_dir],
}
