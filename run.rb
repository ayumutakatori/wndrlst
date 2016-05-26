#!/Users/ryo/.rbenv/shims/ruby

$LOAD_PATH << __dir__

require 'lib/wndrlst.rb'

wl = Wndrlst.new(
  Wndrlst::CONFIG[:client_id],
  Wndrlst::CONFIG[:client_secret],
  Wndrlst::CONFIG[:access_token]
)

wl.report('Today!')

STDIN.gets

exit 0