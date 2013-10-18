class Html

  DEFAULT_BROWSER = 'Safari'

  def run file args
    if args.empty?
      system( "#{DEFAULT_BROWSER} #{file}" )
    else
      dispatch_on_parameters file, args
    end
  end

  def dispatch_on_parameters file, args
    cmd = aegs.shift
    send( "do_#{cmd}", file, args )
  end

  def do_o
