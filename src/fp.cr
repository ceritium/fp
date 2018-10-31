copy = ARGV.delete("-c") || ARGV.delete("--copy")

path = ARGV[0]
if File.exists?(path)
  path = File.real_path(path)

  copy && Process.run "pbcopy" do |pbcopy|
    print_path path, pbcopy.input
  end

  print_path path, STDOUT
end

def print_path(path, stream)
  stream.puts path
end
