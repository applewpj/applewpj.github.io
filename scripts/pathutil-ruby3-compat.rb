# frozen_string_literal: true

# pathutil 0.16.2 passes keyword arguments as a positional Hash, which breaks
# Jekyll's file watcher on Ruby 3. Keep this local preview compatibility shim
# until the GitHub Pages dependency stack no longer needs pathutil 0.16.2.
require "pathutil"

module PathutilRuby3Compat
  def read(*args, **kwargs)
    kwargs[:encoding] ||= encoding
    content = File.read(self, *args, **kwargs)

    normalize[:read] ? content.encode(:universal_newline => true) : content
  end
end

Pathutil.prepend(PathutilRuby3Compat) if RUBY_VERSION >= "3.0"
