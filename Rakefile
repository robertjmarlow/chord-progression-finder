task default: %w[test]

task :test do
  sh "./bin/rspec --format doc"
end

task :docs do
  sh "yard doc"
end

task :lint do
  sh "rubocop"
end

task build_all: [:lint, :test, :docs]
