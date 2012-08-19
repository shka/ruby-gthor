require 'gthor'
require 'thor/runner'

class Gthor::Runner < Thor::Runner

  namespace :default

  def method_missing(meth, *args)
    meth = meth.to_s
    initialize_thorfiles(meth)
    klass, task = Thor::Util.find_class_and_task_by_namespace(meth)
    self.class.handle_no_task_error(task, false) if klass.nil?
    args.unshift(task) if task
    klass.start(args, :shell => self.shell)
  end

  def initialize(*)
    super
    Gem.find_files('../Gthorfile').each { |thorfile|
      Thor::Util.load_thorfile(thorfile)
    }
    thorfile = File.expand_path('./Gthorfile')
    Thor::Util.load_thorfile(thorfile) if File.exist?(thorfile)
  end

end
