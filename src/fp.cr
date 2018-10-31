copy = ARGV.delete("-c") || ARGV.delete("--copy")

unless ARGV.empty?
  path = ARGV[0]
  if File.exists?(path)
    path = File.real_path(path)

    copy && Process.run "pbcopy" do |pbcopy|
      print_path path, pbcopy.input
    end

    print_path path, STDOUT
  end
end

def print_path(path, stream)
  stream.puts path
end
